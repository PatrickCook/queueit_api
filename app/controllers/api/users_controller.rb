module Api
  class UsersController < Api::ApiController
    def index
      users = User.all
      render :json => {:status => "ok", :users => users}
    end

    def new
    end

    def create
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end
  end
end
