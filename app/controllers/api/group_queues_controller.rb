module Api
  class GroupQueuesController < Api::ApiController
    def index
      @queues = GroupQueue.all
      render :json => { :status => "ok", :queues => @queues }
    end

    def create
      # TODO - fetch logged in user id for this
      @queue = GroupQueue.create(queue_params.merge({user_id: 1}))

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
