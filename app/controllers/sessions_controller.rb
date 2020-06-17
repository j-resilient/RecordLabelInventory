class SessionsController < ApplicationController
    def new
        render :new
    end

    def create
        user = User.find_by_credentials(
            session_params[:email],
            session_params[:password]
        )
        
        if user.nil?
            # display errors
            render :new
        else
            token = user.reset_session_token!
            session[:session_token] = token
            render json: user
        end
    end

    private
    def session_params
        params.require(:session).permit(:email, :password)
    end
end