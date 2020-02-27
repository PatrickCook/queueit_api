class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  def require_member_of_queue
    queue = Group.find(params[:group_id])
    queue.members.include?(@current_user)
  end

  def render_404
    render status: :not_found, json: { message: "Record not found"}
  end
end