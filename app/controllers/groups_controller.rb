class GroupsController < ApplicationController
  load_and_authorize_resource
  def index
    @groups = current_user.groups
  end
end
