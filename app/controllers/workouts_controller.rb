class WorkoutsController < ApplicationController

  get '/workouts/show' do
    if is_logged_in?
      @user = current_user
      @workouts = Workout.all
      erb :'/workouts/workouts'
    else
      redirect to '/users/login'
    end
  end
end
