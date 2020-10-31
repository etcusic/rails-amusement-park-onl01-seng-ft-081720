class RidesController < ApplicationController
    def create
        params.permit(:attraction_id)
        @attraction = Attraction.find_by_id(params[:attraction_id])
        @user = User.find_by_id(session[:user_id])
        @ride = Ride.create(user_id: @user.id, attraction_id: @attraction.id)
        @message = @ride.take_ride
        flash[:notice] = @message
        redirect_to user_path(@user)
    end
end
