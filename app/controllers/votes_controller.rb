class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @link = Link.find(params[:link_id])
    vote = @link.votes.new
    vote.user = current_user
    vote.save
    
    redirect_to @link
  end
end
