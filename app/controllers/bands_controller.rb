class BandsController < ApplicationController
    def index
        render :index
    end

    def show
        @band = Band.find_by(id: params[:id])
        render :show
    end

    def new
        @band = Band.new
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
        @band = Band.find_by(id: params[:id])
        render :edit
    end

    def update
        @band = Band.find_by(id: params[:id])
        if @band.update_attributes(bands_params)
            redirect_to band_url(@band)
        else
            flash.now[:errors] = @band.errors.full_messages
            render :edit
        end
    end

    def destroy
        band = Band.find_by(id: params[:id])
        band.destroy
        redirect_to bands_url
    end

    private
    def bands_params
        params.require(:band).permit(:name)
    end
end