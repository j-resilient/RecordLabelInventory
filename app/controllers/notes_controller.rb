class NotesController < ApplicationController
    def create
        note = Note.new(notes_params)
        note.user_id = current_user.id
        if note.save
            redirect_to track_url(note.track_id)
        else
            flash.now[:errors] = notes.errors.full_messages
            redirect_to track_url(note.track_id)
        end
    end

    def destroy
        n = Note.find_by(id: params[:id])

        unless current_user == n.user
            render text: "You are not authorized to delete this note.", status: :forbidden
        end

        track = Track.find_by(id: n.track_id)
        n.destroy
        redirect_to track_url(track)
    end

    private
    def notes_params
        params.require(:notes).permit(:note, :track_id)
    end
end