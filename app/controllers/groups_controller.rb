class GroupsController < ApplicationController

  get "/groups" do
    if logged_in?
      @user = current_user
      erb :"/groups/index.html"
    else
      redirect '/'
    end
  end

  get "/groups/new" do
    if logged_in?
      erb :"/groups/new.html"
    else
      redirect '/'
    end
  end

  post "/groups" do
    group = Group.create(params["group"])
    group.users << current_user
    group.owner = current_user.username
    group.save
    redirect "/groups/#{group.slug}"
  end

  get "/groups/:slug" do
    @group = Group.find_by_slug(params[:slug])
    if logged_in? && @group.users.include?(current_user)
      erb :"/groups/show.html"
    else
      redirect '/'
    end
  end

  patch "/groups/:slug/members" do
    group = Group.find_by_slug(params[:slug])
    user = User.find_by(username: params[:username])
    if user
      group.users << user
    end
    redirect "/groups/#{group.slug}"
  end
#  get "/groups/:id/edit" do
#    erb :"/groups/edit.html"
#  end

#  patch "/groups/:id" do
#    redirect "/groups/:id"
#  end

#  delete "/groups/:id/delete" do
#    redirect "/groups"
#  end
end
