class AlbumsController < ApplicationController
    def new
        render json: params
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

    private
    def album_params
        params.require(:album).permit(:title, :year, :studio, :band_id)
    end
end