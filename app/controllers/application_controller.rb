class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :is_admin?
  def is_admin?
    if current_user
      return current_user.admin?
    else
      false
    end
  end
end
