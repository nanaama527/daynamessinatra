class SessionsController < ApplicationController

    get '/login' do
        # if logged_in?
        #   flash[:message] = "Hello, #{current_user.username.upcase}"
        #   redirect "names/new"
        # else
        #   erb :'sessions/login'
        # end
        erb :'sessions/login'
    end
    
    post '/login' do
        user = User.find_by(username: params[:username])
        binding.pry
        # if !user
        #   binding.pry
        #   flash[:message] = "Username not registered..."
        #   redirect '/login'
        # elsif !user.authenticate(params[:password])
        #   binding.pry
        #   flash[:message] = "Password does not match..."
        #   redirect '/login'
        # end
    
        if user && user.authenticate(params[:password])
          binding.pry
          session[:user_id] = user.id
          binding.pry
          flash[:message] = "Hello, #{current_user.username.upcase}"
          binding.pry
          redirect '/names/new'
        else
          binding.pry
          flash[:message] = "Log in failed... Try again."
          redirect '/login'
        end
    end
    
    get '/logout' do
        if logged_in?
          session.clear
          redirect '/'
        else
          flash[:message] = "Are you logged in?"
          redirect "/login"
        end
    end
  
    
    
end