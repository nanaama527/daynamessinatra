class UsersController < ApplicationController

    get '/signup' do
      if logged_in?
        flash[:message] = "Hello, #{current_user.username.upcase}"
        redirect "/names/new"
      end
        erb :'users/signup'
    end
  
    post '/signup' do
      binding.pry
      # if params[:password] != params[:password_confirm]
      #   flash[:message] = "Passwords did not match..."
      #   redirect "/signup"
      # elsif User.all.find {|user| user.username == params[:username]}
      #   flash[:message] = "' #{params[:username]} ' is already used by another user."
      #   redirect "/signup"
      # end
  
      # params.delete("password_confirm")
      @user = User.create(params)
     
      if @user.id
        session[:user_id] = @user.id
        flash[:message] = "Account successfully created!!!"
        redirect "/names/new"
      else
        flash[:message] = "Could not create your account. Please try again."
        redirect "/signup"
      end
    end
  

    get '/users/:id' do
      if logged_in?
        erb :'users/show'
      else
        flash[:message] = "Looks like you weren't logged in yet. Please log in below."
        redirect to '/login'
      end
    end
  
    get '/users/:id/edit' do
      if logged_in? && super? || current_user.id == params[:id].to_i
        @user = User.find_by_id(params[:id])
        erb :'users/edit'
      else
        flash[:message] = "Log in first~"
        redirect "/login"
      end
    end
  
    patch '/users/:id' do
      if logged_in? && super? || current_user.id == params[:id].to_i
        params.delete("_method")
        User.update(params[:id], params)
        flash[:message] = "User info successfully updated!"
        redirect "/users/#{params[:id]}"
      else
        flash[:message] = "You are not allowed to edit this user's info."
        redirect "/users"
      end
    end
  
    delete '/users/:id' do
      if logged_in? && super?
        user = User.find_by_id(params[:id])
        flash[:message] = "The account of #{user.username.upcase} deleted!"
        user.destroy
        redirect "/users"
      else
        flash[:message] = "Could not delete the account..."
        redirect "/users/#{params[:id]}"
      end
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

  get '/users/:id' do
      if logged_in? && current_user.id == params[:id].to_i
        @user = User.find_by_id(params[:id])
        @names = @user.names
        erb :'name/show'
      else
        flash[:message] = "You are not allowed to view other users' info."
        if logged_in?
          redirect "/names/show"
        end
        redirect "/login"
      end
  end
  
  get '/users/:id/name' do
      if logged_in?
        @user = User.find_by_id(params[:id])
        if @user
          @posts = Post.all.select {|post|
            post.user == @user
          }.reverse
          erb :'users/user_page'
        else
          flash[:message] = "Something went wrong..."
          redirect "/users/show"
        end
      else
        flash[:message] = "You have to log in first."
        redirect "/login"
      end
    end
  
  end