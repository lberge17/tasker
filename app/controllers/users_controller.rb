class UsersController < ApplicationController

  get "/users" do
    erb :"/users/index.html"
  end

  get "/signup" do
    erb :"/users/new.html"
  end

  post "/users" do
    #create a new user
    #user = User.create(params)
    #redirect "/users/#{user.id}"
  end

  get "/users/:username" do
    #@user = User.find_by_slug(params["slug"])
    erb :"/users/show.html"
  end

  get "/users/:username/edit" do
    #@user = User.find_by_slug(params["slug"])
    erb :"/users/edit.html"
  end

  patch "/users/:username" do
    #user = User.find_by_slug(params["slug"])
    #redirect "/users/#{user.slug}"
  end

  delete "/users/:username/delete" do
    #user = User.find(params["id"])
    #user.destroy
    redirect "/signup"
  end
end
