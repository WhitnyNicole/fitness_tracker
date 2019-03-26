class UsersController < ApplicationController

get '/users/signup' do
  erb :'/users/signup.html'
end

post '/users/signup' do
  user = User.new(params)
  if user.save
    session[:user_id] = user.id
    redirect "/workouts"
  else
    redirect '/users/signup'
  end
end

  # POST: /users
  post "/users" do
    user = User.new(params)
    user.save
    redirect "/users/#{user.id}"
  end

  # GET: /users/5
  get "/users/:id" do
    @user = User.find(params[:id])
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
