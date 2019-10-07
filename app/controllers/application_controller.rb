require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "AY50H3IU4I32I555F" #still need to set something secure and set that in git.ignore
    use Rack::Flash
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.username}"
    else
      redirect '/login'
    end
  end

  get "/about" do
    erb :"about.html"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by(id: session[:user_id])
    end

    def in_group?(group)
      group.members.include?(current_user) || group.owner == current_user
    end
  end
end
