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
        erb :'users/login'
    end 
end 