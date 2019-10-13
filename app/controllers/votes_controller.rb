class VotesController < ApplicationController
  before_action :require_member

  def create
    @current_user.votes.create(song_id: params[:song_id])
  end

  def destroy
    @current_user.votes.where(song_id: params[:song_id]).first&.destroy
  end
end
