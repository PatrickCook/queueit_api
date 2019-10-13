module Api
  class GroupsController < Api::ApiController
    def index
      # TODO - fetch logged in user id for this
      @user = User.find(1)
      @queues = @user.group_queues
      render :json => { :status => "ok", :queues => @queues }
    end

    def create
      # TODO - fetch logged in user id for this
      @user = User.first
      @queue = GroupQueue.create(queue_params.merge({owner_id: 1}))
      @queue.users << @user

      if @queue.save
        render status: :created, json: {status: "ok", queue: @queue}
      else
        render status: :bad_request, json: { status: "error", message: @queue.errors.full_message }
      end
    end

    def show
      @queue = GroupQueue.find(params[:id])
      render :json => { status: "ok", queue: @queue }
    end

    def update
      @queue = GroupQueue.find(params[:id])

      if @queue.update_attributes(user_params)
        render status: :ok, json: { status: "ok", queue: @queue }
      else
        render status: :bad_request, json: { status: "error", message: @queue.errors.full_messages }
      end
    end

    def join
      # TODO - fetch logged in user id for this
      @user = User.all.first
      @queue = GroupQueue.find(params[:group_queue_id])

      @queue.users << @user
      @queue.cur_members += 1
      @queue.save

      render status: :ok, json: { status: "ok" }

    rescue ActiveRecord::RecordNotUnique => error
      render status: :bad_request, json: { status: "error", message: "You are already a member of the queue."}
    end

    def leave
      # TODO - fetch logged in user id for thiss
      @user = User.all.first
      @queue = GroupQueue.find(params[:group_queue_id])

      @queue.users.delete(@user)
      @queue.cur_members -= 1
      @queue.save

      render status: :ok, json: { status: "ok" }
    end

    def destroy
      @queue = GroupQueue.find(params[:id])

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
  end
end
