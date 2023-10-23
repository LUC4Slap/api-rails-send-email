class User < ApplicationRecord
    has_many :emails
    # has_secure_password
    scope :by_login, ->(login) { where('login = ?', login) }
end
