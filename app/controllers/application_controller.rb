class ApplicationController < ActionController::Base
  include Pundit
  include Clearance::Controller
  protect_from_forgery with: :exception
  include SessionsHelper
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
  def user_not_authorized
    flash[:warning] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end


end
