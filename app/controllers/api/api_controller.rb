module Api
  class ApiController < ApplicationController

    def index
        render json: {status: "ok", message: "Welcome to the Queueit Api"}
    end

    def respond_with_errors(object)
      render json: {status: "something went wrong", errors: "insert error"}
    end
  end
end
