class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :post_id, :created_at, :updated_at

  def post_id
    object.post.id
  end
end
