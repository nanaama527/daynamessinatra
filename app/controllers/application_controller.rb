require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions
    set :sessions_secret, "thisisoursessionsecret"
    
    register Sinatra::Flash
  end


  get "/" do
    erb :welcome
  end

  helpers do
    def logged_in?
      session[:user_id]
    end
    # def current_user
    #   @user ||= User.find_by(id: session[:user_id])
    #   # binding.pry
    # end
    
    


    def current_user
      User.find_by(id: session[:user_id]) 
    end

    # def logged_in?
    #     !!current_user
    # end

    
  end




end

