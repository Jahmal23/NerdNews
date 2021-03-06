class CommentsController < ApplicationController


  def create
   byebug
    @comment = current_user.comments.new(comment_params)

  if @comment.save
    flash[:success] = 'Comment created'
  end

    redirect_to @comment.commentable
  end

  def show
    @comment = Comment.find(params[:id])
  end


  private

  def comment_params
    params.require(:comment).permit(:commentable_type, :commentable_id, :body)
  end



end