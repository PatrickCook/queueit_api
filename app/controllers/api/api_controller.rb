module Api
  class ApiController < ApplicationController
    def respond_with_errors(object)
      render json: {status: "something went wrong", errors: "insert error"}
    end
  end
end
