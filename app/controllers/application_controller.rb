# application controller
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname, roles: []])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :surname, roles: []])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :surname, roles: []])
  end

  def respond_modal_with(*args, &blk)
  options = args.extract_options!
  options[:responder] = ModalResponder
  respond_with *args, options, &blk

end
