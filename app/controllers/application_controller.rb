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
  
  # Check to see if the current user owns the resource that he/she is
  # currently accessing. For example, if you are the owner of a campaign,
  # you should be able to see many more options on that campaign's page
  # compared to someone who is not the owner. For example, edit buttons
  # should only be exclusive and visible to you.
  def is_owner?
    # The admin should be able to see everything
    #if current_user.admin?
   #   return true
   # end
    if @is_owner.nil?
      if current_user != nil && @owner != nil
        if @owner == current_user
          return @is_owner = true
        end
      end
      return @is_owner = false
    else
      return @is_owner
    end
  end
  
  
  # Defines the SecurityTransgression exception, which is the object thrown
  # when someone accesses something they are not allowed to.
  class SecurityTransgression < StandardError; end
  
   def ensure_ownership
      raise SecurityTransgression unless (is_owner? || is_admin?)
    end
    
   def ensure_admin
     raise SecurityTransgression unless is_admin?
   end

end
