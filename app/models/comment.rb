# == Schema Information
#
# Table name: comments
#
#  id                :bigint           not null, primary key
#  content           :text             not null
#  author_id         :integer          not null
#  post_id           :integer          not null
#  parent_comment_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Comment < ApplicationRecord
    validates :content, presence: true
    after_initialize :ensure_post_id!

    belongs_to :author,
        foreign_key: :author_id,
        primary_key: :id,
        class_name: :User

    belongs_to :post

    has_many :child_comments,
        foreign_key: :parent_comment_id,
        primary_key: :id,
        class_name: :Comment

    belongs_to :parent_comment,
        foreign_key: :parent_comment_id,
        primary_key: :id,
        class_name: :Comment,
        optional: true

    private
    def ensure_post_id!
        self.post_id ||= self.parent_comment.post_id if parent_comment
    end
end
