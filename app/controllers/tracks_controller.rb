class TracksController < ApplicationController
    def new
        @album = Album.find_by(id: params[:album_id])
        render :new
        # render json: "new"
    end

    def create
        track = Track.new(track_params)
        track.album_id = params[:album_id]
        if track.save
            render json: track
            # redirect_to track_url(track)
        else
            flash.now[:errors] = track.errors.full_messages
            render :new
        end
    end

    def edit
        @track = Track.find_by(id: params[:id])
        render :edit
    end
    
    def update
        @track = Track.find_by(id: params[:id])
        if @track.update_attributes(track_params)
            redirect_to track_url(track)
        else
            flash.now[:errors] = @track.errors.full_messages
            render :edit
        end
    end
    
    def show
        @track = Track.find_by(id: params[:id])
        render :show
    end
    
    def destroy
        track = Track.find_by(id: params[:id])
        track.destroy
        redirect_to album_url(track.album_id)
    end

    private
    def track_params
        params.require(:track).permit(:title, :ord, :lyrics, :bonus)
    end
end