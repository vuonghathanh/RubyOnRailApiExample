# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  include Response
  respond_to :json
  private

  def respond_with(resource, _opts = {})
    success_response(UserSerializer.new(resource).serializable_hash[:data][:attributes], "Logged in successfully.")
  end

  def respond_to_on_destroy
    if current_user
      success_response(nil, "logged out successfully")
    else
      error_response("Couldn't find an active session.", :unauthorized)
    end
  end
end
