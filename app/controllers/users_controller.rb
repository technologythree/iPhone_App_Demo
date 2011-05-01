class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    
    respond_to do |format|
    if @user.save
      session[:user_id] = @user.id
      format.html { redirect_to(root_url, :notice => 'Signed Up.') }
      format.mobile { redirect_to(root_url, :notice => 'Signed Up.') }
      format.xml  { render :xml => root_url, :status => :created, :location => @user }
    else
      format.html { render :action => "new" }
      format.mobile { render :action => "new" }
      format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
    end
    end
  end
  
end
