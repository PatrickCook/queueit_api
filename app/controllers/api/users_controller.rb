module Api
  class UsersController < Api::ApiController
    def index
      users = User.all

      render :json => {
        :status => "ok",
        :users => users.to_json(:only => [:id, :username])
      }
    end

    def new
    end

    def create
    end

    def show
      user = User.find(params[:id])

      render :json => {
        :status => "ok",
        :user => user.to_json(:only => [:id, :username])
      }
    end

    def edit
    end

    def update
    end

    def destroy
    end
  end
end
