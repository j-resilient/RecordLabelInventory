class ApplicationController < ActionController::Base
    helper_method :login, :current_user, :logout, :logged_in?

    def current_user
        return nil if session[:session_token].nil?
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def login!(user)
        token = user.reset_session_token!
        session[:session_token] = token
        @current_user = user
    end

    def logout
        current_user.reset_session_token!
        session[:session_token] = nil
        @current_user = nil
    end

    def logged_in?
        session[:session_token].nil?
    end
end
