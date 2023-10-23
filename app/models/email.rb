class Email < ApplicationRecord
    belongs_to :user

    scope :by_user, ->(user_id) { where('user_id = ?', user_id) }
end
