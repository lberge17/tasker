class TasksController < ApplicationController

  get "/groups/:slug/tasks" do
    @group = Group.find_by_slug(params[:slug])
    if logged_in? && (@group.members.include?(current_user) || @group.owner == current_user)
      erb :"/tasks/index.html"
    else
      redirect '/'
    end
  end

  get "/groups/:slug/tasks/new" do
    @group = Group.find_by_slug(params[:slug])
    if logged_in? && (@group.members.include?(current_user) || @group.owner == current_user)
      erb :"/tasks/new.html"
    else
      redirect '/'
    end
  end

  post "/groups/:slug/tasks" do
    group = Group.find_by_slug(params[:slug])
    if !params["title"].empty?
      task = Task.create(title: params["title"], complete?: false)
      if !params["todo_1"].empty?
        task.sub_tasks << SubTask.create(content: params["todo_1"], complete?: false)
      end
      if !params["todo_2"].empty?
        task.sub_tasks << SubTask.create(content: params["todo_2"], complete?: false)
      end
      if !params["todo_3"].empty?
        task.sub_tasks << SubTask.create(content: params["todo_3"], complete?: false)
      end
      task.group = group
      task.save
    end
    redirect "/groups/#{group.slug}/tasks"
  end

  get "/groups/:slug/tasks/:id" do
    @group = Group.find_by_slug(params[:slug])
    if logged_in? && (@group.members.include?(current_user) || @group.owner == current_user)
      @task = Task.find_by(id: params[:id])
      erb :"/tasks/show.html"
    else
      redirect '/'
    end
  end

  get "/groups/:slug/tasks/:id/edit" do
    @group = Group.find_by_slug(params[:slug])
    if logged_in? && (@group.members.include?(current_user) || @group.owner == current_user)
      @task = Task.find_by(id: params[:id])
      erb :"/tasks/edit.html"
    else
      redirect '/'
    end
  end

#  patch "/groups/:slug/tasks/:id" do
#    @group = Group.find_by_slug(params[:slug])
#    redirect "/tasks/:id"
#  end

  delete "/groups/:slug/tasks/:id/delete" do
    @group = Group.find_by_slug(params[:slug])
    redirect "/tasks"
  end
end
