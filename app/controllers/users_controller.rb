class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotUnique, :with => :record_not_unique

  skip_before_action :authenticate_request, only: :create

  def index
    users = User.all
    render json: users, each_serializer: UserSerializer
  end

  def create
    user = User.new(user_params)
    if @user.save
      render status: :created, json: user, serializer: UserSerializer
    else
      render status: :bad_request, json: { status: "error", message: user.errors.full_messages }
    end
  end

  def show
    user = User.find(params[:id])
    render json: user, serializer: UserSerializer
  end

  def update
    user = User.find(params[:id])

    if user.update_attributes(user_params)
      render status: :ok, json: user, serializer: UserSerializer
    else
      render status: :bad_request, json: { status: "error", message: user.errors.full_messages }
    end
  end

  def destroy
    user = User.find(params[:id])
    if @user.destroy
      render status: :ok, json: { status: "ok" }
    else
      render status: :not_found, json: { status: "error", message: user.errors.full_messages }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
