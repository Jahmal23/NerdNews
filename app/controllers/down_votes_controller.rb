class DownVotesController < ApplicationController

  def create
    @vote = current_user.down_votes.new(vote_params)

    @vote.user = current_user

    post = Post.find(post_params[:post_id])

    post.down_votes << @vote

    if @vote.save
      flash[:success] = 'Downvote created'
    else
      flash[:error] = 'Downvote could not be created'
    end

    redirect_to root_path
  end

  private

  def vote_params
    params.require(:down_vote).permit(:votable_type, :votable_id)
  end

  def post_params
    params.permit(:post_id)
  end

end
