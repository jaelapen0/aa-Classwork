class SessionsController < ApplicationController
    def new #goes to the login page
        render :new
    end

    def create #logs in user, redirects to user's url
        user = User.find_by_redentials(
            params[:user][:email]
            params[:user][:password]
        )
        if user
            login_user!(user)
            redirect_to user_url(user)
        else
            flash.now[:errors] = user.errors.full_messages
            redirect_to new_session_url
        end
    end

    def destroy #logs them out
        logout_user!(current_user)
        redirect_to new_session_url
    end
end