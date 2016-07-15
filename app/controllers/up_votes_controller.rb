class UpVotesController < ApplicationController


  def create
    @vote = current_user.up_votes.new(vote_params)

    byebug

    if @vote.save
      flash[:success] = 'Vote created'

    else
      flash[:error] = 'Vote could not be created'

    end

    redirect_to @vote.votable
  end



  private

  def vote_params
    params.require(:up_vote).permit(:votable_type, :votable_id)
  end



end