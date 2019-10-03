class GroupsController < ApplicationController

#  get "/groups" do
#    erb :"/groups/index.html"
#  end

  get "/groups/new" do
    erb :"/groups/new.html"
  end

#  post "/groups" do
#    redirect "/groups"
#  end

#  get "/groups/:id" do
#    erb :"/groups/show.html"
#  end

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
