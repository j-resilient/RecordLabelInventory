class BandsController < ApplicationController
    def index
        render json: "index"
    end

    def show
        @band = Band.find_by(id: params[:id])
        render :show
    end

    def new
        render :new
    end

    def create
        new_band = Band.new(bands_params)
        if new_band.save
            redirect_to band_url(new_band)
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