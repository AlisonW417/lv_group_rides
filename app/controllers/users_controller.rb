class UsersController < ApplicationController
    get '/signup' do
        if current_user 
            redirect '/rides'
        end 
         erb :'users/signup'
    end 

    post '/signup' do 
        user = User.new(params)
        if user.save
            session[:user_id] = user.id 
            redirect '/rides'
        else 
            flash[:error] = user.errors.full_messages
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
            flash[:error] = "Invalid Login"
            redirect '/login'
        end 
    end 

    get '/users/:id' do 
        @user = User.find_by(params)
        @rides = @user.rides

        if current_user == @user
            erb :'users/show'
        else 
            flash[:error] = "You do not have access to view that page."
            redirect '/'
        end 
    end 

    get '/logout' do 
        session.destroy 
        redirect '/login'
    end 
end 