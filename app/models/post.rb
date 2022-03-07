# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  sub_id     :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
    validates :title, presence: true

    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User

    belongs_to :sub

    has_many :comments,
        class_name: :Comment,
        foreign_key: :post_id

    def comments_by_parent
        comments_by_parent = Hash.new { |hash, key| hash[key] = [] }
    
        self.comments.includes(:author).each do |comment|
            comments_by_parent[comment.parent_comment_id] << comment
        end
    
        comments_by_parent
    end
end
