class BandsController < ApplicationController
    def index
        render json: "index"
    end

    def show
        render json: "show"
    end

    def new
        render json: "new"
    end

    def create
        new_band = Band.new(bands_params)
        if new_band.save
            redirect_to bands_url
        else
            flash.now[:errors] = new_band.errors.full_messages
            render :new
        end
    end

    def edit
        render json: "edit"
    end

    def update
        render json: "update"
    end

    def destroy
        render json: "destroy"
    end

    private
    def bands_params
        params.require(:band).permit(:name)
    end
end