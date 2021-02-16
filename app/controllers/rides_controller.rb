class RidesController < ApplicationController
    get '/rides' do 
        erb :'rides/index'
    end 
end 