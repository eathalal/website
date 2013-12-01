class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # callbacks
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :authorise

  delegate :allow?, to: :current_permission
  helper_method :allow?

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name]
  end

private
  
  def authorise
    unless current_permission.allow?(params[:controller], params[:action], current_resource)
      redirect_to root_url, alert: "Not authorised."
    end
  end

  def current_permission
    @current_permission ||= Permission.new(current_user)
  end

  def current_resource
    nil
  end

end