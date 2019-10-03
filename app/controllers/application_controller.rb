require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "AY50H3IU4I32I555F" #still need to set something secure and set that in git.ignore
  end

  get "/" do
    if logged_in?
      redirect "/user/#{current_user.username}"
    else
      redirect '/signup'
    end
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end
end
