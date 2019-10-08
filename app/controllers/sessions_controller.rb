class SessionsController < ApplicationController

  get '/login' do
    if logged_in?
      redirect "/"
    else
      erb :"/sessions/login.html"
    end
  end

  post "/login" do
    user = User.find_by(username: params["username"])
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
