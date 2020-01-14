class Post < ApplicationRecord
    validates :title, presence: true
    validates :subs, presence: { message: 'must have at least one sub' }

    belongs_to :author,
        class_name: :User,
        foreign_key: :user_id

    has_many :post_subs, dependent: :destroy
    has_many :subs, 
        through: :post_subs,
        source: :sub

    has_many :comments
    
    has_many :votes, as: :votable, class_name: "Vote"

    def comments_by_parent
        comments_by_parent = Hash.new { |hash, key| hash[key] = [] }

        self.comments.includes(:author).each do |comment|
            comments_by_parent[comment.parent_comment_id] << comment
        end
        comments_by_parent
    end

    def user_votes
        self.votes.sum(:value)
    end
end
