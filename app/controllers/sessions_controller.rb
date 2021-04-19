class SessionsController < ApplicationController

    get '/login' do
        # if logged_in?
        #   flash[:message] = "Hello, #{current_user.username.upcase}"
        #   redirect "names/new"
        # else
        #   erb :'sessions/login'
        # end
        erb :'users/login'
    end
    
    post '/login' do
        user = User.find_by(username: params[:username])
        if !user
          flash[:message] = "Username not registered..."
          redirect '/login'
        elsif !user.authenticate(params[:password])
          flash[:message] = "Password does not match..."
          redirect '/login'
        end
    
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          flash[:message] = "Hello, #{current_user.username.upcase}"
          redirect '/names/new'
        else
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