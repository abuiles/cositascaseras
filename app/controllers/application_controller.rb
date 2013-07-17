class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit([:email, :password, :password_confirmation, :interests]) }
  end

  def mixpanel
    @mixpanel ||= Mixpanel::Tracker.new ENV['COSITAS_MIXPANEL_API_TOKEN'], { :env => request.env, persist: true }
  end
end
