class ApiController < ActionController::API
  def index
    render json: { application: 'queueit_api', version: 0.1, status: 'good' }
  end
end