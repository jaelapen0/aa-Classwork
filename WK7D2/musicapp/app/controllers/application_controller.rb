class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper_method :current_user
    helper_method :logged_in?
    private

    def require_no_user!
        #render json: 'yoyo'
        #redirect_to user_url if current_user 
    end

    def current_user
       # debugger
        return nil unless session[:session_token]
       # debugger
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        current_user.nil? == false
    end


    def log_in_user!(user)
        @current_user = user
        session[:session_token] = user.session_token
    end

    def logout_user!
        if current_user.nil?  == false
        current_user.reset_session_token!
        session[:session_token] = nil
        end
    end

    def require_user!
        redirect_to new_session_url if current_user.nil?
    end

end
