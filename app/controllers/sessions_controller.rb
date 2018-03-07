class SessionsController < Devise::SessionsController
  # logout
  def destroy
    super
    session[:keep_signed_out] = true
  end
end
