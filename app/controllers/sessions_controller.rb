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
            flash.now[:errors] = ["Invalid credentials."]
            render :new
        else
            login!(user)
            redirect_to user_url(user)
        end
    end

    def destroy
        logout
    end

    private
    def session_params
        params.require(:session).permit(:email, :password)
    end
end