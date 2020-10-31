class AttractionsController < ApplicationController
    before_action :attraction, only: [:index, :show, :edit, :update, :destroy]

    def index
        @attraction = Attraction.new
        @user = User.find_by_id(session[:user_id])
        @attractions = Attraction.all
    end

    def new
        @attraction = Attraction.new
    end

    def create
        # binding.pry
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def edit
    end

    def show
        @user = User.find_by_id(session[:user_id])
    end

    def update
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    private

    def attraction
        @attraction = Attraction.find_by_id(params[:id])
    end

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end

    def current_user
        @user ||= User.find_by(id: session[:user_id])
      end

end
