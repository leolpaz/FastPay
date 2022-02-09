class GroupsController < ApplicationController
  load_and_authorize_resource
  def index
    @groups = current_user.groups.includes(:payments)
  end

  def new; end

  def create
    new_group = current_user.groups.new(group_params)
    if new_group.save
      flash[:notice] = 'Your new category has been created'
      redirect_to groups_path
    else
      flash[:alert] = 'We failed to create your category, make sure you filled all fields'
      redirect_to [:new_group]
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
