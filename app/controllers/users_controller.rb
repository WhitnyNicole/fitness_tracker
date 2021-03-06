class UsersController < ApplicationController

get '/users/signup' do
  erb :'/users/signup.html'
end

post '/users/signup' do
  user = User.new(params)
  if user.save
    session[:user_id] = user.id
    redirect "/workouts"
    # redirect "/users/#{user.id}"
  else
    redirect '/users/signup'
  end
end

get '/users/login' do
   "you are logged in"
   if is_logged_in?
     redirect '/workouts/show'
   else
     "Please log into your account"
     erb :'/users/login.html'
   end
 end


 post '/users/login' do
   user = User.find_by(:username => params[:username])
   if user && user.authenticate(params[:password])
       session[:user_id] = user.id
   end
       redirect to '/workouts/show'
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
