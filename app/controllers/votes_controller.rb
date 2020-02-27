class VotesController < ApplicationController
  before_action :require_member_of_queue

  def create
    vote = @current_user.votes.create(song_id: params[:song_id])

    if vote
      render status: :ok, json: vote, serializer: VoteSerializer
    else
      render status: :bad_request, json: { status: "error", message: vote.errors.full_message }
    end
  end

  def destroy
    vote = @current_user.votes.where(song_id: params[:song_id]).first

    if vote.destroy
      render status: :no_content
    else
      render status: :bad_request, json: { message: "Could not unvote song."}
    end
  end
end
