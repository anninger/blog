class PostsController < ApplicationController
  def create
    post = Post.create(post_params)

    if post.persisted?
      render json: { post: post }, status: :created
    else
      render json: { errors: post.errors }, status: :unprocessable_entry
    end
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
