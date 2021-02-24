class RidesController < ApplicationController
    get '/rides' do 
        redirect_if_not_logged_in 
        @rides = Ride.all      
        erb :'rides/index'
    end 

    get '/rides/new' do 
        redirect_if_not_logged_in
        erb :'rides/new'
    end 

    post '/rides' do 
        redirect_if_not_logged_in
        ride = Ride.new(params)
        ride.user_id = session[:user_id]
        if ride.save
            redirect "/rides/#{ride.id}" 
        else 
            flash[:error] = ride.errors.full_messages
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
        if @ride.user == current_user 
            erb :'rides/edit'
        else 
            flash[:error] = "You cannot edit another user's ride."
            redirect '/rides'
        end 
    end 

    patch '/rides/:id' do 
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
        redirect_if_not_logged_in
        ride = Ride.find_by(id: params[:id])
        if ride.user == current_user
            ride.delete 
        end 
        redirect '/rides'
    end 
end 