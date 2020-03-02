class User::AsUserEdit < User
  strip_attributes only: [:name]
  
  has_secure_password validations: false

  validates :password, strength: true, confirmation: true, allow_blank: true
  validates :password_confirmation, presence: { if: -> { password.present? } }
end
