class AlbumsController < ApplicationController
    def new
        @band = Band.find_by(id: params[:band_id])
        @album = Album.new
        render :new
    end

    def create
        album = Album.new(album_params)
        if album.save
            redirect_to album_url(album)
        else
            flash.now[:errors] = album.errors.full_messages
            render :new
        end
    end

    def edit
        @album = Album.find_by(id: params[:id])
        @band = @album.band
        render :edit
    end

    def update
        @album = Album.find_by(id: params[:id])
        if @album.update_attributes(album_params)
            redirect_to album_url(@album)
        else
            flash.now[:errors] = @album.errors.full_messages
            render :edit
        end
    end

    def destroy
        a = Album.find_by(id: params[:id])
        band = a.band
        a.destroy
        redirect_to band_url(band)
    end

    def show
        @album = Album.find_by(id: params[:id])
        render :show
    end

    private
    def album_params
        params.require(:album).permit(:title, :year, :studio, :band_id)
    end
end