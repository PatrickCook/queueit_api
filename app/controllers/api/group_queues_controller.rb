module Api
  class GroupQueuesController < Api::ApiController
    def index
      queues = GroupQueue.all
      render :json => {:status => "ok", :users => queues}
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
