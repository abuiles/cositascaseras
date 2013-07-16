class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def mixpanel
    @mixpanel ||= Mixpanel::Tracker.new ENV['COSITAS_MIXPANEL_API_TOKEN'], { :env => request.env, persist: true }
  end
end
