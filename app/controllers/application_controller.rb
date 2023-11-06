class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # deviseの処理を行う場合、devise_parameter_sanitizer.permit(:sign_up,keys:[:email])を実行


private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
