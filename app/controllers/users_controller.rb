class UsersController < ApplicationController
    def new
        render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            # log user in
            redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end