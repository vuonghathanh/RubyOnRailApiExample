class CurrentUserController < ApplicationController
  before_action :authenticate_user!, only: %i[ index ]
  def index
    success_response(current_user, 'ok')
  end

  def test
    success_response(current_user, "test ok")
  end
end
