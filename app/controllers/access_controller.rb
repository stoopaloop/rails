class AccessController < ApplicationController
layout 'access'
   
  before_filter :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index
    menu
    render('menu')
  end
  
  def login
  
  end
  
  
  def attempt_login
     authorized_user = User.authenticate(params[:name], params[:password])
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:name] = authorized_user.name
      session[:email] =authorized_user.email
      flash[:notice] = "You are now logged in."
      redirect_to(:action => 'menu')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
  end

  def menu
    
  end
   
  def logout
    session[:user_id] = nil
    session[:name] = nil
    flash[:notice] = "You have been logged out."
    redirect_to(:action => "login")
  end

end
