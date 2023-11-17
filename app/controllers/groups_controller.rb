class GroupsController < ApplicationController
  before_action :authenticate_user!, only: %i[index]

  def index
    @groups = Group.paginate(page: params[:page], per_page: params[:limit]).order(created_at: :desc)
    success_response(@groups, "success")
  end
end
