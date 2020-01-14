class Sub < ApplicationRecord
    validates :title, :description, presence: true
    validates :title, uniqueness: true

    belongs_to :moderator,
        class_name: :User,
        foreign_key: :moderator_id

    has_many :post_subs, dependent: :destroy
    has_many :posts,
        through: :post_subs,
        source: :post
end
