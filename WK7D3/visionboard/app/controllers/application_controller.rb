class ApplicationController < ActionController::Base

    helper_method :logged_in?, :current_user

    def current_user
        #has to be able to return nil?
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def login_user!
        session[:session_token] = @current_user.session_token
    end

    def logs_out
        session[:session_token] = nil
        @current_user.reset_session_token!
    end

    #require_user 
    #the before action for all session methods

    #require_no_user 
    #the before action for all user controller methods

    def logged_in?
        session[:session_token] == @current_user.session_token
    end
    #will dictate how the layout behave
end
