class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    vote = current_user.votes.new(article_id: params[:article_id])
    flash[:warning] = 'You cannot vote an article more than once!' unless vote.save
    redirect_back
  end

  def destroy
    if (vote = Vote.find_by(user_id: current_user.id, article_id: params[:article_id]))
      vote.destroy
    end
    redirect_back
  end
end
