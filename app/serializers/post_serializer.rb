class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at, :updated_at,
    :user_id, :links

  def user_id
    object.user.id
  end

  def links
    {
      comments: "/posts/#{object.id}/comments"
    }
  end
end
