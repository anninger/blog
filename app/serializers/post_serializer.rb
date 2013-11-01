class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at, :updated_at,
    :user_id, :links, :tag_list

  def user_id
    object.user.id
  end

  def links
    {
      comments: "/comments?post_id=#{object.id}"
    }
  end

  def tag_list
    object.tag_list.join(',')
  end

#<<<<<<< HEAD
    #:user_id, :links
#=======
    #:user_id, :tag_list, :links
#>>>>>>> ca477e68d1b0c0b1423a6155b8e8c382d6e5fb65


#<<<<<<< HEAD
  #def links
    #{
      #comments: "/posts/#{object.id}/comments"
#=======
  #def tag_list
    #object.tag_list.join(',')
  #end

end
