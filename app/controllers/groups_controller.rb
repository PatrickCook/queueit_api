class GroupsController < ApplicationController
  def index
    @queues = @current_user.joined_queues
    render :json => { :status => "ok", :queues => @queues }
  end

  def create
    @queue = @current_user.owned_queues << Group.create(queue_params)
    @queue.members << @current_user

    if @queue.save
      render status: :created, json: {status: "ok", queue: @queue}
    else
      render status: :bad_request, json: { status: "error", message: @queue.errors.full_message }
    end
  end

  def show
    @queue = Group.find(params[:id])
    render :json => { status: "ok", queue: @queue }
  end

  def update
    @queue = Group.find(params[:id])

    if @queue.update_attributes(user_params)
      render status: :ok, json: { status: "ok", queue: @queue }
    else
      render status: :bad_request, json: { status: "error", message: @queue.errors.full_messages }
    end
  end

  def join
    @queue = Group.find(params[:group_id])

    @queue.members << @current_user
    @queue.cur_members += 1
    @queue.save

    render status: :ok, json: { status: "ok" }

  rescue ActiveRecord::RecordNotUnique => error
    render status: :bad_request, json: { status: "error", message: "You are already a member of the queue."}
  end

  def leave
    @queue = Group.find(params[:group_id])

    @queue.users.delete(@current_user)
    @queue.cur_members -= 1
    @queue.save

    render status: :ok, json: { status: "ok" }
  end

  def destroy
    @queue = Group.find(params[:id])

    if @queue.destroy
      render status: :ok, json: { status: "ok" }
    else
      render status: :not_found, json: { status: "error", message: @queue.errors.full_messages}
    end
  end

  private

  def queue_params
    params.require(:queue).permit(:name, :is_playing, :is_private, :password_hash, :max_members, :max_songs)
  end

  def queue_params_password
    queue_params[:password_hash] if queue_params[:password_hash].present?
  end
end
