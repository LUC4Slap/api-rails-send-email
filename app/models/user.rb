class User < ApplicationRecord
    # has_secure_password
    scope :by_login, ->(login) { where('login = ?', login) }
end
