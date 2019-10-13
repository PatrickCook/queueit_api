class SongsController < ApplicationController
  def index
    @songs = Song.all
    render :json => {status:"ok", songs: @songs}
  end

  def create
    @song = Song.create(song_params)
    @queue = Group.find(params[:group_id])

    if @song.save
      render status: :created, json: { status: "ok", song: @song }
    else
      render status: :bad_request, json: { status: "error", message: @song.errors.full_message }
    end
  end

  def show
    @song = Song.find(params[:id])
    render status: :ok, json: { status: "ok", songs: @song }
  end

  def update
    @song = Song.find(params[:id])

    if @song.update_attributes(song_params)
      render status: :created, json: { status: "ok", song: @song }
    else
      render status: :bad_request, json: { status: "error", message: @song.errors.full_message }
    end
  end

  def destroy
    @song = Song.find(params[:id])

    if @song.destroy
      render status: :ok, json: { status: "ok" }
    else
      render status: :not_found, json: { status: "error", message: @song.errors.full_messages }
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist, :album_image_url, :preview_uri, :spotify_uri, :is_playing, :has_played)
  end
end

