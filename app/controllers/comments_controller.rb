class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)

    if comment.persisted?
      render json: comment, serializer: CommentSerializer, status: :created
    else
      render json: { errors: comment.errors }, status: :unprocessable_entry
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    return head :not_found unless comment

    comment.destroy
    head :no_content
  end

  def index
    if params[:post_id]
      comments = Post.find(params[:post_id]).comments
    else
      comments = Comment.all
    end

    render json: comments, each_serializer: CommentSerializer, meta: { total: comments.count }, status: :ok
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end

end
