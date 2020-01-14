class Post < ApplicationRecord
    validates :title, presence: true
    validates :subs, presence: { message: 'must have at least one sub' }

    belongs_to :author,
        class_name: :User,
        foreign_key: :user_id
end
