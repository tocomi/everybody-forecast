class SessionsController < Devise::SessionsController
  # logout
  def destroy
    super
    session[:keep_signed_out] = true
  end

  ### from https://github.com/plataformatec/devise/wiki/How-To:-Redirect-back-to-current-page-after-sign-in,-sign-out,-sign-up,-update
  def after_sign_out_path_for(resource)
    stored_location_for(resource) || super
  end
end
