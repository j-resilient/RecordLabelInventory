class SessionsController < ApplicationController
    skip_before_action :ensure_logged_in, only: [:new, :create]

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
            redirect_to bands_url
        end
    end

    def destroy
        logout
        redirect_to new_session_url
    end

    private
    def session_params
        params.require(:session).permit(:email, :password)
    end
end