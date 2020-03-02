class User::AsSignUp < User
  strip_attributes except: [ :password, :password_confirmation ]

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: {case_sensitive: false}, format: { with: /\A[a-zA-Z0-9_]{4,}\z/ }
  validates :uuid, uniqueness: true
  validates :password, presence: true, strength: true, confirmation: true
  validates :password_confirmation, presence: { if: -> { password.present? } }

  before_validation :set_uuid, on: :create

  private
  def set_uuid
    self.uuid = RandomToken.gen(36)
  end
end
