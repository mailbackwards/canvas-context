class StoriesController < ApplicationController
    def index
        @stories = Story.order('pubdate DESC')
    end

    def show
        @story = Story.find(params[:id])
    end

    def fetch
        Story.get_new
        redirect_to stories_url
    end
end