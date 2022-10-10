class User < ApplicationRecord
  has_secure_password
  has_secure_token :access_token, length: 36

  has_many :devices

  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
end
