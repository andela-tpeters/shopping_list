class User < ApplicationRecord
  has_secure_password
  validates :email,
    presence: true,
    allow_nil: false,
    format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
    uniqueness: true

  validates :password,
    presence: true,
    confirmation: true,
    length: {minimum: 6},
    allow_nil: false

end
