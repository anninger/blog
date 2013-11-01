class PostsController < ApplicationController
  def create
    post = Post.create(post_params.merge user: current_user)

    if post.persisted?
      render json: post, serializer: PostSerializer, status: :created
    else
      render json: { errors: post.errors }, status: :unprocessable_entry
    end
  end

  def update
    post = Post.find(params[:id])
    if post.update_attributes(post_params)
      render json: post, serializer: PostSerializer, status: :ok
    else
      render json: { errors: post.errors }, status: :unprocessable_entry
    end
  end

  def destroy
    post = Post.find(params[:id])
    return head :not_found unless post

    post.destroy
    head :no_content
  end

  def show
    post = Post.find(params[:id])
    render json: post, serializer: PostSerializer, status: :ok
  end

  def index
    posts = Post.all
    render json: posts, each_serializer: PostSerializer, meta: { total: posts.count }, status: :ok
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
