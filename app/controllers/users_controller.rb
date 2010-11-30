class UsersController < ApplicationController
  def edit
  end

  def update
    current_user.name = params[:user][:name]
    current_user.phone = params[:user][:phone]
    current_user.department = params[:user][:department]
    current_user.student_number = params[:user][:student_number]
    current_user.degree = params[:user][:degree]
    current_user.year = params[:user][:year]
    if current_user.save
      redirect_to grants_path
    else
      flash[:alert] = 'Please fill in all the following fields.'
      redirect_to edit_user_path(current_user)
    end
  end

end
