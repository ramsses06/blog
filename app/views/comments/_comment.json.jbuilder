json.extract! @comment, :id, :article_id, :body, :created_at, :updated_at
json.user do
	json.email @comment.user.email
end
