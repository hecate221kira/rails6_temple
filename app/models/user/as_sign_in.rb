class User::AsSignIn < User
  strip_attributes only: [:username]
  
  has_secure_password validations: false

  validates :username, :password, presence: true
end
