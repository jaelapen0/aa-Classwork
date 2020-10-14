class AlbumsController < ApplicationController
    
    def index
        @albums = Album.all
        render :index
    end

    def create
        @album = Album.new(album_params)
        if @album.save
            redirect_to album_url(@album)
        else
            flash.now[:errors] = @album.errors_messages
            render :new
        end

    end

    def show
        @album = Album.find(params[:id])
        render :show
    end

    def edit
        @album = Album.find(params[:id])
        render :edit
    end

    def destroy

    end

    def update

    end

    private

    def album_params
        params.require(:album).permit(:title, :band_id, :year)
    end
end