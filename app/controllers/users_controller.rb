class UsersController < ApplicationController

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
      if !User.find_by(username: params["username"]) && !User.find_by(email: params["email"])
        if params["password"] == params["password_check"]
          user = User.create(:name => params["name"], :username => params["username"], :email => params["email"], :password => params["password"])
          if user.save
            private_group = Group.create(name: "My Tasks")
            private_group.owner = user
            private_group.save
            session[:user_id] = user.id
            redirect "users/#{user.username}"
          else
            flash[:message] = "Error: unable to sign you up. Please verify info and try again."
            erb :"/users/new.html"
          end
        else
          flash[:message] = "Error: password fields don't match. Try again."
          erb :"/users/new.html"
        end
      else
        flash[:message] = "Error: username is already taken or the email already is registered to an account."
        erb :"/users/new.html"
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

  get "/profile" do
    if logged_in?
      @user = current_user
      erb :"/users/show.html"
    else
      redirect "/"
    end
  end

  get "/users/:username/edit" do
    @user = User.find_by(username: params["username"])
    if logged_in? && @user == current_user
      erb :"/users/edit.html"
    else
      redirect '/'
    end
  end

  patch "/users/:username" do
    user = User.find_by(username: params["username"])
    if user == current_user
      user.update(params["user"])
      redirect "/users/#{user.username}"
    else
      redirect '/'
    end
  end

  delete "/users/:username/delete" do
    user = current_user
    if logged_in?
      session.clear

      user.owned_groups.each do |owned_group|
        owned_group.tasks.each do |task|
          task.sub_tasks.destroy_all
        end
        owned_group.tasks.destroy_all
      end

      user.owned_groups.destroy_all
      user.destroy

      redirect "signup"
    else
      redirect "/"
    end
  end
end
