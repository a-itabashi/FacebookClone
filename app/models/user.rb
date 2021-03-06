class User < ApplicationRecord
  validates :name, presence: true, length: {maximum:20}
  
  validates :email, presence: true, length: {maximum:50},
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: true
  before_validation {email.downcase!}

  has_secure_password
  validates :password, presence: true, length: {minimum: 5}

  has_many :blogs
end
