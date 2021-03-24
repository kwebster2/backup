class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = Attraction.find_by(id: params[:id])
        @user = User.find_by(id: session[:user_id])
        @ride = @attraction.rides.build(user_id: @user.id)
    end
end