class SessionsController < ApplicationController
    before_action :require_no_user!, only: [:create, :new]
    def create
        user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )

        if user.nil?
            flash.now[:errors] = ['Incorrect username and/or password']
            render :new
        else
            log_in_user!(user)
            redirect_to bands_url
        end
    
    end

    def destroy
        logout_user!
        redirect_to new_sessions_url
    end

    def new
        render :new
    end
end