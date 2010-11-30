class GrantsController < ApplicationController
  before_filter :fetch_grant, :only => [:show, :edit, :update]
  def index
    @grants = Grant.all
  end

  def new
    @grant = Grant.new
  end

  def create
    @grant = Grant.create(params[:grant])
    @grant.user_id = current_user.id
    flash[:notice] = 'Your grant has been created.'
    @grant.save
    redirect_to grants_path
  end

  def show
    @comments = @grant.comments
    @comment = Comment.new
  end

  def edit
  end

  def update
    @grant.update_attributes(params[:grant])
    @grant.save
    flash[:notice] = 'Your grant has been successfully updated.'
    redirect_to grant_path(params[:id])
  end

  def destroy
  end
  
  def fetch_grant
    @grant = Grant.find(params[:id])
  end

end
