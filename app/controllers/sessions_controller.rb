class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.authenticate(params[:username], params[:password])
    respond_to do |format|
    if user
      session[:user_id] = user.id
      format.html { redirect_to(root_url, :notice => 'Logged In.') }
      format.mobile { redirect_to(root_url, :notice => 'Logged In.') }
      format.xml  { render :xml => root_url, :status => :created, :location => @user }
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
