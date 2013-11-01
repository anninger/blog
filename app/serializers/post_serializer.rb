class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at, :updated_at,
    :user_id, :tag_list, :links

  def user_id
    object.user.id
  end

  def tag_list
    object.tag_list.join(',')
  end

  def links
    {
      comments: "posts/#{object.id}/comments"
    }
  end
end
