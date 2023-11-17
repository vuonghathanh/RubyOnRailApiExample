# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  include Response
  respond_to :json
  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      success_response(UserSerializer.new(resource).serializable_hash[:data][:attributes], "Signed up successfully.")
    else
      error_response("User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}", :unprocessable_entity)
    end
  end
end
