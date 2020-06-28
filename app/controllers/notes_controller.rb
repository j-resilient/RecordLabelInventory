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

    private
    def notes_params
        params.require(:notes).permit(:note, :track_id)
    end
end