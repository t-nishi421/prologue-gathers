class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :return_message

  # エラー画面に関する記述
  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end
  include ErrorHandlers if Rails.env.production? or Rails.env.staging?

  # def render_404(exception = nil)
  #   if exception
  #     logger.info "Rendering 404 with exception: #{exception.message}"
  #   end
  #   render template: "errors/error_404", status: 404, layout: 'application'
  # end

  # def render_422(exception = nil)
  #   if exception
  #     logger.info "Rendering 422 with exception: #{exception.message}"
  #   end
  #   render template: "errors/error_422", status: 422, layout: 'application'
  # end

  # def render_500(exception = nil)
  #   if exception
  #     logger.info "Rendering 500 with exception: #{exception.message}"
  #   end
  #   render template: "errors/error_500", status: 500, layout: 'application'
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def return_message
    if user_signed_in? && current_user.rental == -1
      current_user.rental = 0
      current_user.save
      flash[:notice] = '本の貸出期限を超過したため、貸出中の本は返却されました。'
    end
  end
end
