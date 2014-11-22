class VideosController < ApplicationController
    def index
        @videos = Video.order('published_date DESC')
    end

    def show
        @video = Video.find(params[:id])
    end

    def fetch
        Video.get_new
        redirect_to videos_url
    end
end