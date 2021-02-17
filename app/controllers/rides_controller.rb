class RidesController < ApplicationController
    get '/rides' do 
        erb :'rides/index'
    end 

    get '/new' do 
        redirect_if_not_logged_in
        erb :'rides/new'
    end 

    post '/rides' do 
        #binding.pry
        redirect_if_not_logged_in
        ride = Ride.create(params)
        ride.user_id = session[:user_id]
        ride.save
        redirect "/rides" #change this to ride show page later
    end 
end 