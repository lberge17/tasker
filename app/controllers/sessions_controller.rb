class SessionsController < ApplicationController

  get '/login' do
    if logged_in?
      redirect "/"
    else
      erb :"/sessions/login.html"
    end
  end

  post "/login" do
    if params["username_email"].include?("@")
      user = User.find_by(email: params["username_email"])
    else
      user = User.find_by(username: params["username_email"])
    end
    if user && user.authenticate(params["password"])
      session[:user_id] = user.id
      redirect "/"
    else
      flash[:message] = "Invalid login"
      erb :"/sessions/login.html"
    end
  end

  post '/logout' do
    session.clear
    redirect '/login'
  end
end
