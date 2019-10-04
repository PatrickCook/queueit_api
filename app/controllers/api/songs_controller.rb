module Api
  class SongsController < Api::ApiController
    def index
      songs = Song.all
      render :json => {status:"ok", songs: songs}
    end

    def create
      
    end

    def show
      song = Song.find(params[:id])
      render :json => {status:"ok", songs: song}
    end

    def edit
    end

    def update
    end

    def destroy
    end
  end
end
