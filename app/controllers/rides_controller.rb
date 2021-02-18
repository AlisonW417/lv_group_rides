class RidesController < ApplicationController
    get '/rides' do 
        erb :'rides/index'
    end 

    get '/rides/new' do 
        redirect_if_not_logged_in
        erb :'rides/new'
    end 

    post '/rides' do 
        #binding.pry
        redirect_if_not_logged_in
        ride = Ride.new(params)
        ride.user_id = session[:user_id]
        if ride.save
            redirect "/rides/#{ride.id}" 
        else 
            redirect '/rides/new'
        end 
    end

    get '/rides/:id' do 
        redirect_if_not_logged_in
        @ride = Ride.find_by(id: params[:id])
        erb :'rides/show'
    end 

    get '/rides/:id/edit' do
        redirect_if_not_logged_in
        @ride = Ride.find_by(id: params[:id])
        erb :'rides/edit'
    end 

    patch '/rides/:id' do 
        #binding.pry
        redirect_if_not_logged_in
        @ride = Ride.find_by(id: params[:id])
        if @ride.user == current_user 
            @ride.update(params[:ride])
            redirect "/rides/#{@ride.id}"
        else 
            redirect '/rides'
        end 
    end 

    delete '/rides/:id' do 
        #binding.pry
        redirect_if_not_logged_in
        ride = Ride.find_by(id: params[:id])
        if ride.user == current_user
            ride.delete 
        end 
        redirect '/rides'
    end 
end 