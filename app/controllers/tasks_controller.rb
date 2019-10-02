class TasksController < ApplicationController

  get "/tasks" do
    erb :"/tasks/index.html"
  end

  get "/tasks/new" do
    erb :"/tasks/new.html"
  end

  post "/tasks" do
    redirect "/tasks"
  end

  get "/tasks/:id" do
    erb :"/tasks/show.html"
  end

  get "/tasks/:id/edit" do
    erb :"/tasks/edit.html"
  end

  patch "/tasks/:id" do
    redirect "/tasks/:id"
  end

  delete "/tasks/:id/delete" do
    redirect "/tasks"
  end
end
