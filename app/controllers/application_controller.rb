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
  before_filter :ensure_user_info # that insurance policy again.
  
  def ensure_user_info
    if !current_user.nil? and current_user.name.nil? and !is_admin?
      if params[:action] != "edit" and params[:controller] != "users" and params[:controller] !='devise/sessions'
        redirect_to edit_user_path(current_user)
      end
    end
  end

end
