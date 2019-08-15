class SongsController < ApplicationController
    def index
        @songs = Song.all
    end

    def show
        set_song
    end

    def new 
        @song = Song.new
    end

    def create
        # this line is KEY for form_for's
        @song = Song.new(song_params)
        if(@song.save)
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def edit
        # checkbox automatically returns "1" if checked or "0" if unchecked (true vs false)
       set_song
    end
    
    def update
        set_song
        if(@song.update(song_params))
            redirect_to song_path(@song)
        else 
            render :edit 
        end
    end

    def destroy 
        set_song
        Song.destroy(set_song.id)
        redirect_to songs_path
    end


    private

    def set_song
        @song = Song.find(params[:id])
    end

    def song_params(*args)
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end
end