class UpVotesController < ApplicationController


  def create
    @vote = current_user.up_votes.new(vote_params)

    @vote.user = current_user

    post = Post.find(post_params[:post_id])

    post.up_votes << @vote

    if @vote.save
      flash[:success] = 'Upvote created'
    else
      flash[:error] = 'Upvote could not be created'
    end

    redirect_to root_path
  end

  private

  def vote_params
    params.require(:up_vote).permit(:votable_type, :votable_id)
  end

  def post_params
    params.permit(:post_id)
  end

end