class AlbumsController < ApplicationController
    def new
        @band = Band.find_by(id: params[:band_id])
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
        Album.find_by(id: params[:id]).destroy
        redirect_to albums_url
    end

    def show
        @album = Album.find_by(id: params[:id])
        render json: @album
    end

    private
    def album_params
        params.require(:album).permit(:title, :year, :studio, :band_id)
    end
end