class UpVotesController < ApplicationController


  def create

    @vote = UpVote.new(vote_params)

    @vote.user = current_user


    if @vote.save
      flash[:success] = 'Vote created'

    else
      flash[:error] = 'Vote could not be created'

    end

    redirect_to root_path
  end



  private

  def vote_params
    params.require(:up_vote).permit(:votable_type, :votable_id)
  end



end