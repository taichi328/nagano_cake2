class ApplicationController < ActionController::Base



protected
  # strong parameterで姓と名の属性(firstNameとlastName)をpermitする
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstName, :lastName])
  end
end