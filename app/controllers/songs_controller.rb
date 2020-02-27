class SongsController < ApplicationController
  before_action :set_group

  def index
    render json: @group.songs, each_serializer: SongSerializer
  end

  def create
    song = @group.songs.create(song_params)

    if song
      render status: :created, json: song, serializer: SongSerializer
    else
      render status: :bad_request, json: { status: "error", message: song.errors.full_message }
    end
  end

  def show
    song = @group.songs.find(params[:id])
    render status: :ok, json: song, serializer: SongSerializer
  end

  def update
    song = @group.songs.find(params[:id])

    if song.update_attributes(song_params)
      render status: :created, json: song, serializer: SongSerializer
    else
      render status: :bad_request, json: { status: "error", message: song.errors.full_message }
    end
  end

  def destroy
    song = @group.songs.find(params[:id])

    if song.destroy
      render status: :ok, json: { status: "ok" }
    else
      render status: :not_found, json: { status: "error", message: song.errors.full_messages }
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id]) if params[:group_id].present?
  end

  def song_params
    params.require(:song).permit(:title, :artist, :album_image_url, :preview_uri, :spotify_uri, :is_playing, :has_played)
  end
end

