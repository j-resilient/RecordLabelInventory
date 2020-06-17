class UsersController < ApplicationController
    def new
        render :new
    end

    def create
        user = User.new(user_params)

        if user.save
            # log user in
            render json: user
        else
            render json: user.errors.full_messages
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end