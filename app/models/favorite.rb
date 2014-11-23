class Favorite < ActiveRecord::Base
    belongs_to :favorable
    belongs_to :user
    validates_presence_of :user_id, :favorable_id, :favorable_type
    validates_uniqueness_of :favorable_type, scope: [:user_id, :favorable_id]

    def favorable
        favorable_type.capitalize.constantize.find(favorable_id)
    end

    protected

    def associate_user
        unless self.user_id
            return self.user_id = session[:user_id] if session[:user_id]
            return false
        end
    end
end