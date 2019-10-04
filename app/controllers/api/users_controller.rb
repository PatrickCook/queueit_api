module Api
  class UsersController < Api::ApiController
    rescue_from ActiveRecord::RecordNotUnique, :with => :record_not_unique

    def index
      @users = User.all
      render json: { status: "ok", users: @users }
    end

    def create
      @user = User.new(user_params)
      if @user.save
        render status: :created, json: { status: "ok", user: @user }
      else
        render status: :bad_request, json: { status: "error", message: @user.errors.full_messages }
      end
    end

    def show
      @user = User.find(params[:id])
      render json: { status: "ok", user: @user }
    end

    def update
      @user = User.find(params[:id])
      puts user_params
      if @user.update_attributes(user_params)
        render status: :ok, json: { status: "ok", user: @user }
      else
        render status: :bad_request, json: { status: "error", message: @user.errors.full_messages }
      end
    end

    def destroy
      @user = User.find(params[:id])
      if @user.destroy
        render status: :ok, json: { status: "ok" }
      else
        render status: :not_found, json: { status: "error", message: @user.errors.full_messages }
      end
    end

    private

    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :password_hash, :role)
    end
  end
end
