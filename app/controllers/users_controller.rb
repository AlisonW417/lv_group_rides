class UsersController < ApplicationController
    get '/signup' do
        if current_user 
            redirect '/rides'
        end 
         erb :'users/signup'
    end 

    post '/signup' do 
        #binding.pry
        user = User.create(params)
        if user.valid?
            session[:user_id] = user.id 
            redirect '/rides'
        else 
            ## ADD FLASH MESSAGE HERE
            redirect '/signup'
        end 
    end 

    get '/login' do 
        if current_user 
            redirect '/rides'
        end 
        erb :'users/login'
    end 

    post '/login' do 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect "/users/#{@user.id}"
        else 
            # ADD FLASH MESSAGE HERE
            redirect '/login'
        end 
    end 

    get '/users/:id' do 
        @user = User.find_by(params)
        @rides = @user.rides
        erb :'users/show'
    end 

    get '/logout' do 
        session.destroy 
        redirect '/login'
    end 
end 