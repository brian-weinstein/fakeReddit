json.extract! comment, :id, :content, :author_id, :post_id, :parent_comment_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
