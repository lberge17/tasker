require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    use Rack::Flash
  end

  get "/" do
    if logged_in?
      redirect "/groups"
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

    def in_group?(group, user = current_user)
      group.members.include?(user) || group.owner == user
    end
  end
end
