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
    erb :"/groups/new.html"
  end

  post "/groups" do
    group = Group.create(params["group"])
    group.users << current_user
    group.save
    redirect "/groups/#{group.slug}"
  end

  get "/groups/:slug" do
    @group = Group.find_by_slug(params[:slug])
    erb :"/groups/show.html"
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
