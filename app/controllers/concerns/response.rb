module Response
  def success_response(data, message = nil)
    render json: {success: true, status: :ok, data: data, message: message}, status: :ok
  end

  def error_response(message, status = :bad_request)
    render json: {success: false, status: status, message: message}, status: status
  end
end