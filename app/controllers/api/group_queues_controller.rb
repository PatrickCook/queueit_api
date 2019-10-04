module Api
  class GroupQueuesController < Api::ApiController
    def index
      @queues = GroupQueue.all
      render :json => { :status => "ok", :queues => @queues }
    end

    def new
    end

    def create
    end

    def show
      @group_queue = GroupQueue.find(params[:id])
      render :json => { :status => "ok", :queue => @group_queue }
    end

    def edit
    end

    def update
    end

    def destroy
    end
  end
end
