class Sub < ApplicationRecord
    validates :title, :description, presence: true
    validates :title, unique: true

    belongs_to :moderator,
        class_name: :User,
        foreign_key: :moderator_id
end
