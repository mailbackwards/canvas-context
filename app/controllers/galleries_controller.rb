class GalleriesController < ApplicationController
    def index
        @galleries = Gallery.order('pub_date DESC')
    end

    def show
        @gallery = Gallery.find(params[:id])
    end

    def fetch
        Gallery.get_new
        redirect_to galleries_url
    end
end