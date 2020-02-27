class GroupsController < ApplicationController
  def index
    groups = @current_user.joined_groups
    render json: groups, each_serializer: GroupSerializer
  end

  def create
    group = @current_user.owned_groups << Group.create(group_params)
    group.members << @current_user

    if group.save
      render status: :created, json: {status: "ok", group: group}
    else
      render status: :bad_request, json: { status: "error", message: group.errors.full_message }
    end
  end

  def show
    group = Group.find(params[:id])
    render json: group, serializer: GroupSerializer
  end

  def update
    group = Group.find(params[:id])

    if group.update_attributes(user_params)
      render status: :ok, json: { status: "ok", group: group }
    else
      render status: :bad_request, json: { status: "error", message: group.errors.full_messages }
    end
  end

  def join
    group = Group.find(params[:group_id])

    if group.authenticated?(params[:password_hash])
      group.members << @current_user
      group.cur_members += 1
      group.save

      render status: :ok, json: { status: "ok" }
    else
      render status: :forbidden, json: { status: "error", message: "Cannot join group because password is missing/incorrect." }
    end
  rescue ActiveRecord::RecordNotUnique => error
    render status: :bad_request, json: { status: "error", message: "You are already a member of the group."}
  end

  def leave
    group = Group.find(params[:group_id])

    unless group.owner == @current_user
      group.members.delete(@current_user)
      group.cur_members -= 1
      group.save

      render status: :ok, json: { status: "ok" }
    else
      render status: :ok, json: { status: "error", message: "You cannot leave a group you own. Please delete group instead." }
    end
  end

  def destroy
    @group = Group.find(params[:id])

    if @group.destroy
      render status: :ok, json: { status: "ok" }
    else
      render status: :not_found, json: { status: "error", message: @group.errors.full_messages}
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :is_playing, :is_private, :password_hash, :max_members, :max_songs)
  end

  def group_params_password
    group_params[:password_hash] if group_params[:password_hash].present?
  end
end
