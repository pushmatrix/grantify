class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :ensure_user_info # that insurance policy again.
  
  def ensure_user_info
    if !current_user.nil? and current_user.name.nil?
      if params[:action] != "edit" and params[:controller] != "users"
        flash[:notice] = 'Please fill in all the following information.'
        redirect_to edit_user_path(current_user)
      end
    end
  end
end
