class AppsController < ApplicationController
    
    before_filter :authenticate_user, :only => [:new, :create]
      
    def new
        #Application form
        @application = Application.new
    end
    
    def create
        #Create a new application
        @application = Application.new(apps_params)
        if @application.save
          flash[:notice] = "Yay, your registration was successful"
          flash[:color] = "valid"
        else
          flash[:notice] = "Darn, something went wrong!"
          flash[:color] = "invalid"
        end
        render "new"
    end
    
    def apps_params
        params.require(:application).permit(:name, :description, :user_id)
    end
end
