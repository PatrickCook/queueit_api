module Api
  class VotesController < Api::ApiController
    before_action :require_member

    def create
      # TODO - use logged in user
      @user = User.first
      @user.votes.create(song_id: params[:song_id])
    end

    def destroy
      # TODO - use logged in user
      @user = User.first
      @user.votes.where(song_id: params[:song_id]).first&.destroy
    end

    private

    def require_member
      user = User.first
      user.is_member?(queue_id: params[:group_queue_id])
    end
  end
end
