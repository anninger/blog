class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])

    comment = post.comments.create(comment_params)
    if comment.persisted?
      render json: comment, serializer: CommentSerializer, status: :created
    else
      render json: { errors: comment.errors }, status: :unprocessable_entry
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    return head :not_found unless comment

    comment.destroy
    head :no_content
  end

  def index
    post = Post.find(params[:post_id])
    comments = post.comments

    render json: comments, each_serializer: CommentSerializer, meta: { total: comments.count }, status: :ok
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
