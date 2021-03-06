class CommentsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @comment = Comment.create(params[:comment])
    @comment.grant_id = params[:grant_id]
    @comment.user_id = current_user.id
    flash[:success] = 'Comment posted.'
    @comment.save
    redirect_to grant_path(params[:grant_id])
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
