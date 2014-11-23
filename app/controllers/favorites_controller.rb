class FavoritesController < ApplicationController
    before_action :authenticate_user!

    def index
        scope = Favorite.where(user_id: current_user.id)
        @favorite_stories = scope.where(favorable_type: 'story').order('created_at DESC')
        @favorite_videos = scope.where(favorable_type: 'video').order('created_at DESC')
        @favorite_galleries = scope.where(favorable_type: 'gallery').order('created_at DESC')
    end

    def show
        @favorite = Favorite.find(params[:id])
        if @favorite.user_id != current_user.id
            respond_with :not_found
        end
    end

    def new
        @favorite = Favorite.create(user_id: current_user.id,
            favorable_type: params[:favorable_type], 
            favorable_id: params[:favorable_id]
            )
        redirect_to params[:from] || favorites_path
    end

    def destroy
        @favorite = Favorite.find(params[:id])
        if @favorite.user_id != current_user.id
            respond_with :not_found
        else
            @favorite.destroy
        end
        redirect_to params[:from] || favorites_path
    end
end