class UsersController < ApplicationController
  def edit
  end

  def update
    
    current_user.name = params[:user][:name]
    current_user.phone = params[:user][:phone]
    current_user.department = params[:user][:department]
    current_user.email = params[:user][:email]
    current_user.degree = params[:degree]
    current_user.year = params[:user][:year]
    if current_user.save
      redirect_to grants_path
    else
      render :edit
    end
  end

end
