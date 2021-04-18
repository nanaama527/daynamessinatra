require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    # set :sessions_secret, "daynames1234"

    set :public_folder, 'public'
    set :views, 'app/views'
  end

  register Sinatra::Flash

  get "/" do
    erb :welcome
  end

  helpers do
    def current_user
        User.find_by(id: session[:user_id]) 
    end

    def logged_in?
        !!current_user
    end

    def owner?
      current_user == post_owner
    end
  end
end

