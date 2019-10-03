class UsersController < ApplicationController

#  get "/users" do
#    erb :"/users/index.html"
#  end

  get "/signup" do
    if logged_in?
      redirect "users/#{current_user.username}"
    else
      erb :"/users/new.html"
    end
  end

  post "/signup" do
    if logged_in?
      redirect "users/#{current_user.username}"
    else
      if !User.find_by(username: params["username"]) || !User.find_by(email: params["email"])
        if params["password"] == params["password_check"]
          user = User.create(:name => params["name"], :username => params["username"], :email => params["email"], :password => params["password"])
          if user.save
            session[:user_id] = user.id
            redirect "users/#{user.username}"
          else
            #throw error to verify signup info
            redirect '/signup'
          end
        else
          #create ever message saying passwords don't match
          redirect '/signup'
        end
      else
        #throw error saying username is already taken or that email is already registered
        redirect '/signup'
      end
    end
  end

  get "/login" do
    if logged_in?
      redirect "users/#{current_user.username}"
    else
      erb :"/users/login.html"
    end
  end

  post "/login" do
    user = User.find_by(username: params["username"])
    if user && user.authenticate(params["password"])
      session[:user_id] = user.id
      redirect "users/#{user.username}"
    else
      #throw invalid login error
      redirect "/login"
    end
  end

  post '/logout' do
    session.clear
    redirect '/login'
  end

  get "/users/:username" do
    @user = User.find_by(username: params["username"])
    erb :"/users/show.html"
  end

  get "/users/:username/edit" do
    @user = User.find_by(username: params["username"])
    erb :"/users/edit.html"
  end

  patch "/users/:username" do
    #user = User.find_by(username: params["username"])
    #redirect "/users/#{user.slug}"
  end

  delete "/users/:username/delete" do
    #user = User.find_by(username: params["username"])
    #user.destroy
    redirect "/signup"
  end
end
