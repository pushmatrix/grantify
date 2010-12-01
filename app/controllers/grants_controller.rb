class GrantsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :fetch_grant, :only => [:show, :edit, :update, :accept, :reject,:submit]
  before_filter :fetch_owner, :only => [:show, :edit, :update, :accept, :reject]
  before_filter :ensure_ownership, :only => [:show, :edit, :update] 
  before_filter :ensure_admin, :only=> [:search,:distribute_funds,:reports,:accept,:reject]
  def index
    if !is_admin?
      @grants = current_user.grants.order("status DESC").order('created_at DESC')
    else
      @grants = Grant.order('status DESC')
    end
  end

  def new
    @grant = Grant.new
  end
  
  def search
    if params[:tracking_number].present?
      begin
        id = Grant.id_from_tracking_number(params[:tracking_number])
        @grant = Grant.find(id)
        redirect_to @grant
      rescue Exception=>e
        puts e
        flash[:notice]= "There are no grant applications with tracking number #{params[:tracking_number]}."
        render :search
      end
    end
  end
  
  def distribute_funds
  end
  
  def reports
  end
  
  def submit
    if @grant.status == Grant::STATUS[:EDITING]
      @grant.status = Grant::STATUS['IN PROCESS']
      if @grant.save
        flash[:notice] = "Your grant was successfully submitted."
        redirect_to grants_path
        return
      else
        render :edit
      end
    else
      redirect_to @grant
    end
  end
  
  def create
    @grant = Grant.new(params[:grant])
    if is_admin?
      if params[:student_number]
        begin
          student = User.find_by_student_number(params[:student_number])
          if student
            @grant.user = student
          else
            raise Exception
          end
        rescue Exception => e
          flash[:alert] = "Not student was found with number #{params[:student_number]}"
          render :new
          return
        end
      end
    end
    @grant.prev_apply = params[:prev_apply]
    @grant.status = Grant::STATUS[:EDITING]
    @grant.region = params[:region]
    @grant.user_id = current_user.id
    if @grant.save(:validate=>false)
      
      if @grant.valid?
        flash[:notice] = 'Your grant application is now complete. Please press the submit button when you are ready.'
      else
        flash[:notice] = 'Application saved!'
      end
      redirect_to @grant
    else
      render :new
    end
  end



  def show
    @comment = Comment.new
    @comments = @grant.comments.all
  end

  def edit
    if @grant.status != Grant::STATUS[:EDITING]
      redirect_to @grant
    end
  end

  def update
    @grant.update_attributes(params[:grant])
    @grant.prev_apply = params[:prev_apply]
    @grant.region = params[:region]
    @grant.save(:validate=>false)
    if @grant.valid?
      flash[:notice] = 'Your grant application is now complete. Please press the submit button when you are ready.'
    else
      flash[:notice] = 'Application saved!'
    end
    redirect_to grant_path(params[:id])
  end

  def destroy
  end
  
  def fetch_grant
    @grant = Grant.find(params[:id])
  end
  
  def fetch_owner
    @owner = @grant.user
  end

  def accept
    flash[:notice] = 'The grant was accepted!'
    if @grant.status == Grant::STATUS['IN PROCESS']
      @grant.status =  Grant::STATUS[:TEMPORARY]
      @grant.save
      redirect_to grants_path
    end
  end
  
  def reject
    flash[:notice] = 'The grant was rejected!'
    if @grant.status == Grant::STATUS['IN PROCESS']
      @grant.status =  Grant::STATUS[:REJECTED]
      @grant.save
      redirect_to grants_path
    end
  end
  
  def distribute
    @grants = Grant.all(:conditions => {:status => 2})
    @grants.each { |grant|
      grant.status = Grant::STATUS[:APPROVED]
      grant.funding = 300 + rand(500)
      grant.save
    }
    flash[:notice] = 'Funds have been distributed.'
    redirect_to grants_path
  end
end
