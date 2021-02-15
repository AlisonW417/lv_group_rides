require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "lv_group_rides"
  end

  get "/" do
    erb :home
  end

  #helpers do 
    #def current_user 
      #User.find_by(id: session[:user_id])
    #end 

    #def redirect_if_not_logged_in 
      #if !current_user 
        #redirect '/login'
      #end 
    #end 
  #end 

end
