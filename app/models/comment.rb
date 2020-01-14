class Comment < ApplicationRecord
    validates :body, presence: true

    after_initialize :ensure_post_id!
    
    belongs_to :post

    belongs_to :author,
        class_name: :User,
        foreign_key: :user_id

    
    has_many :child_comments,
        class_name: :Comment,
        foreign_key: :parent_comment_id
    
    belongs_to :parent_comment,
        class_name: :Comment,
        foreign_key: :parent_comment_id,
        optional: true

    private
    def ensure_post_id!
        self.post_id ||= self.parent_comment.post_id if parent_comment
    end


end
