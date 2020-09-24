class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(sign_up, keys:[:nickname,:famili_name,:first_name,:famili_name_kana,:first_name_kana,:birthday])
end
