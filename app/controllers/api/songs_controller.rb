module Api
  class SongsController < Api::ApiController
    def index
      songs = Song.all
      render :json => {:status => "ok", :songs => songs.to_json}
    end

    def new
    end

    def create
    end

    def show
      song = Song.find(params[:id])
      render :json => {:status => "ok", :song => song.to_json}
    end

    def edit
    end

    def update
    end

    def destroy
    end
  end
end
