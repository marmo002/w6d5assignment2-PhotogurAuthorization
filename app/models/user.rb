class User < ApplicationRecord
  has_many :pictures

  validates :email, presence: true

  has_secure_password


end
