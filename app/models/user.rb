class User < ActiveRecord::Base
    has_many :favorites

    # Include default devise modules. Others available are:
    # :token_authenticatable, :confirmable,
    # :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    def get_favorite_id(favorable)
        f = favorites.where(favorable_type: favorable.class.to_s.downcase, favorable_id: favorable.id).first
        f.nil? ? nil : f.id
    end
end
