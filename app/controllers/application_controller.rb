class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  def check_admin!
    unless current_user.is_admin?
      redirect_to root_path
    end
  end
end
