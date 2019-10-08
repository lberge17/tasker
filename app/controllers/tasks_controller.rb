class TasksController < ApplicationController

  get "/groups/:id/tasks" do
    @group = Group.find_by(id: params[:id])
    if logged_in? && in_group?(@group)
      erb :"/tasks/index.html"
    else
      redirect '/'
    end
  end

  get "/groups/:id/tasks/new" do
    @group = Group.find_by(id: params[:id])
    if logged_in? && in_group?(@group)
      erb :"/tasks/new.html"
    else
      redirect '/'
    end
  end

  post "/groups/:id/tasks" do
    group = Group.find_by(id: params[:id])
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
    redirect "/groups/#{group.id}/tasks"
  end

  get "/groups/:id/tasks/:task_id" do
    @group = Group.find_by(id: params[:id])
    if logged_in? && in_group?(@group)
      @task = Task.find_by(id: params[:task_id])
      erb :"/tasks/show.html"
    else
      redirect '/'
    end
  end

  get "/groups/:id/tasks/:task_id/edit" do
    @group = Group.find_by(id: params[:id])
    if logged_in? && in_group?(@group)
      @task = Task.find_by(id: params[:task_id])
      erb :"/tasks/edit.html"
    else
      redirect '/'
    end
  end

  patch "/groups/:id/tasks/:task_id" do
    group = Group.find_by(id: params[:id])
    task = Task.find_by(id: params[:task_id])

    task.update(title: params["title"])


    redirect "/groups/#{group.id}/tasks/#{task.id}"
  end

  patch "/groups/:id/tasks/:task_id/todos" do
    group = Group.find_by(id: params[:id])
    task = Task.find_by(id: params[:task_id])

    if !params["assignments"].empty?
      params["assignments"].each do |todo_id, username|
        todo = SubTask.find_by(id: todo_id)
        if username == ""
          todo.assigned = nil
          todo.save
        else
          user = User.find_by(username: username)
          if todo && user && in_group?(group, user)
            todo.assigned = user
            todo.save
          end
        end
      end
    end

    if params["task"]
      task.update(complete?: true)
      task.sub_tasks.update_all(complete?: true)
    else
      task.sub_tasks.each do |sub_task|
        if params["sub_task"] && params["sub_task"].include?(sub_task.id.to_s)
          sub_task.update(complete?: true)
        else
          sub_task.update(complete?: false)
        end
      end
      task.update(complete?: false)
    end

    if !params["content"].empty?
      todo = SubTask.create(content: params["content"])
      todo.task = task
      todo.save
    end

    redirect "/groups/#{group.id}/tasks/#{task.id}"
  end

  delete "/groups/:id/tasks/complete/delete" do
    group = Group.find_by(id: params[:id])
    group.tasks.each do |task|
      if task.complete? == true
        task.sub_tasks.destroy_all
        task.destroy
      end
    end
    redirect "/groups/#{group.id}/tasks"
  end

  delete "/groups/:id/tasks/:task_id/delete" do
    group = Group.find_by(id: params[:id])
    task = Task.find_by(id: params[:task_id])
    task.sub_tasks.destroy_all
    task.destroy

    redirect "/groups/#{group.id}/tasks"
  end

  delete "/groups/:id/tasks/:task_id/todos/delete" do
    group = Group.find_by(id: params[:id])
    task = Task.find_by(id: params[:task_id])

    if params["sub_task"]
      params["sub_task"].each do |id|
        SubTask.find(id.to_i).destroy
      end
    end

    redirect "/groups/#{group.id}/tasks/#{task.id}"
  end
end
