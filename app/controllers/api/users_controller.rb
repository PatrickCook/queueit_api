module Api
  class UsersController < Api::ApiController
    rescue_from ActiveRecord::RecordNotUnique, :with => :record_not_unique

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
      user = User.new(user_params)
      if user.save
        render json: { status: "ok", user: user.to_json(:only => [:id, :username]) }
      else
        render json: { status: "error", message: user.errors.full_messages }
      end
    end

    def show
      user = User.find(params[:id])
      render json: { status: "ok", user: user.to_json(:only => [:id, :username]) }
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private
    def record_not_unique
      render x:status => :conflict,
        :json => {:status => "error", :message => "Cannot create non-unique user"}
    end

    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :password_hash, :role)
    end
  end
end
