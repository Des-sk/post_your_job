require './config/environment'

class ApplicationController < Sinatra::Base

  #Sinatra::Base- http verbs/commands- delet, get, porst, patch, put
  #one controller for every model
  
  #app.controller- any req. that does not belong to a mdels data goes in app.controller
    #about route, contact page
  
  #Post / Put / Patch- receiving something from user/ doesnt have a view
  
    #layout.erb
    # view file that renders across app.  menue bar, navigation, search form, footer
  
  #views mimic CRUD actions 

  #  @instance variables- to comunicate our cotrollers with our views
 
  configure do
    #set :sessions 
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

end
