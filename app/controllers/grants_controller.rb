class GrantsController < ApplicationController
  before_filter :fetch_grant, :only => [:show, :edit, :update, :accept, :reject]
  before_filter :authenticate_user!
  def index
    if !is_admin?
      @grants = current_user.grants.all
    else
      @grants = Grant.all
    end
  end

  def new
    @grant = Grant.new
  end

  def create
    @grant = Grant.create(params[:grant])
    @grant.prev_apply = params[:prev_apply]
    @grant.region = params[:region]
    @grant.user_id = current_user.id
    flash[:notice] = 'Your grant application has been submitted.'
    @grant.save
    redirect_to grants_path
  end

  def show
    @comment = Comment.new
    @comments = @grant.comments.all
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

  def accept
    @grant.status = 4
    @grant.save
    redirect_to grants_path
  end
end
