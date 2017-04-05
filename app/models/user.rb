class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  validates :name, presence:true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX } ,
                    uniqueness: true # :unique option to the validates method
                                     # enforce uniqueness of email addresses

  has_secure_password
    # As long as there is a password_digest column 
    #in the database, adding this one method to our model
    #gives us a secure way to create and authenticate new users.
  validates :password, length: { minimum: 6 }

end
