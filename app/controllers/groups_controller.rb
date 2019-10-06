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
    group.owner = current_user
    group.save
    redirect "/groups/#{group.slug}"
  end

  get "/groups/:slug" do
    @group = Group.find_by_slug(params[:slug])
    if logged_in? && in_group?(@group)
      @user = current_user
      erb :"/groups/show.html"
    else
      redirect '/'
    end
  end

  patch "/groups/:slug/members" do
    group = Group.find_by_slug(params[:slug])
    user = User.find_by(username: params[:username])
    if user && !group.members.include?(user)
      group.members << user
    end
    redirect "/groups/#{group.slug}"
  end

  delete "/groups/:slug/members" do
    group = Group.find_by_slug(params[:slug])
    group.members.delete(User.find(current_user))
    redirect "/groups"
  end

  get "/groups/:slug/edit" do
    @group = Group.find_by_slug(params[:slug])
    if logged_in? && (@group.owner == current_user)
      erb :"/groups/edit.html"
    else
      redirect '/groups'
    end
  end

  patch "/groups/:slug" do
    group = Group.find_by_slug(params[:slug])
    user = User.find_by(username: params["username"])

    group.update(name: params["name"]) if !params["name"].empty?

    group.update(info: params["info"]) if !params["info"].empty?

    if !params["username"].empty? && user && group.members.include?(user)
      group.owner = user
      group.members << current_user
      group.members.delete(User.find(user))
      group.save
    end

    redirect "/groups/#{group.slug}"
  end

  delete "/groups/:slug/delete" do
    group = Group.find_by_slug(params[:slug])
    group.tasks.each{|task| task.sub_tasks.destroy_all }
    group.tasks.destroy_all
    group.destroy
    redirect "/groups"
  end
end
