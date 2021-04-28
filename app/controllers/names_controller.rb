class NamesController < ApplicationController
    register Sinatra::Flash
    
      post '/names' do
        binding.pry
        if params[:birthname] == "" || params[:description] == "" 
          flash[:message] = "Oops! You must enter a day name to see your name description. Please try again."
          redirect to '/names/new'
        else
          @name = Name.new(
            :description => params[:description],
            :birthname => params[:birthname],
            :who => params[:who],
            :user_id => session[:user_id])
            binding.pry
            @name.save
            binding.pry
          redirect to "/names/#{@name.id}"
        end
      end






      delete "/names/:id" do
        if logged_in?
        # binding.pry
          @name = Name.find_by_id(params[:id])
          binding.pry
          if @name.user_id == current_user.id
            binding.pry
            @name.destroy
            flash[:message] = "The name profile was deleted."
          else
            flash[:message] = "What's wrong pooh? That ain't your page!"
            redirect to "/names/new"
          end
        # binding.pry
        else
          flash[:message] = "Looks like you weren't logged in yet. Please log in below."
          redirect to '/login'
        end
      end





    
      # Read
      get '/names' do
        # if logged_in?
          @user = current_user
          # @namesof_user = @user.names
          binding.pry
          @names = Name.all
          erb :'names/index'
        # else
        #   flash[:message] = "Looks like you weren't logged in yet. Please log in below."
        #   redirect to '/login'
        # end
      end


      get '/names/new' do 
        # if logged_in?
          erb :'names/new'
        # else
        #   flash[:message] = "Looks like you weren't logged in yet. Please log in below."
        #   redirect to '/login'
        # end
      end
    
    
      get '/names/:id' do
        # if logged_in?
          @name = Name.find_by_id(params[:id])
          # if @name.user_id == session[:user_id]
            # erb :'names/show'
          # elsif @name.user_id != session[:user_id]
          #   redirect '/names'
          # end
        # else
        #   flash[:message] = "Looks like you weren't logged in yet. Please log in below."
        #   redirect to '/login'
        # end
        @user = User.find_by_id(session[:user_id])
        erb :'names/show'
      end
    
      # Updatee
      get '/names/:id/edit' do
        if logged_in?
          @name = Name.find_by_id(params[:id])
          if @name.user_id == session[:user_id]
            erb :'names/edit'
          else
            flash[:message] = "Sorry that's not your profile. You can't edit it."
            redirect to '/names'
          end
        else
          flash[:message] = "Looks like you weren't logged in yet. Please log in below."
          redirect to '/login'
        end
      end
    
      patch '/names/:id' do
        if params[:name] == "" || params[:description] == ""  
          flash[:message] = "Oops! Please try again."
          binding.pry
          redirect to "/names/#{params[:id]}/edit"
        else
          @name = Name.find_by_id(params[:id])
            # @name.description = params[:description]
            # @name.birthname = params[:birthname]
            # @name.who = params[:who]
            # @name.user_id = current_user.id
            params.delete("_method")
          @name.update(params)
          flash[:messsage] = "Your day name has been updated!"
          redirect to "/names/#{@name.id}"
        end
      end
    
      # Delete
      # delete '/names/:id' do
      #   # if logged_in?
      #   binding.pry
      #   #   @name = Name.find_by_id(params[:id])
      #   #   binding.pry
      #   #   if @name.user_id == current_user.id
      #   #   @name.destroy
      #   #      flash[:message] = "The name profile was deleted."
      #   #      redirect to '/signup'
      #   #    end
      #   #   else
      #   #    flash[:message] = "Looks like you weren't logged in yet. Please log in below."
      #   #    redirect to '/login'
      #   # end
      #   # binding.pry
      #   # redirect "names/new"
      #   # end
      # end

end
