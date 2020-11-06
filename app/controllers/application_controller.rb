class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :return_message

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def return_message
    if user_signed_in? && current_user.rental == -1
      current_user.rental = 0
      current_user.save
      flash[:notice] = '本の貸出期限3日が経過したため、貸出中の本は返却されました'
    end
  end
end
