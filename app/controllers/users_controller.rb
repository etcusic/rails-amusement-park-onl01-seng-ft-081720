class UsersController < ApplicationController
    before_action :user, only: [:show, :edit, :update, :destroy]

    def new
        @user = User.new
    end

    def show
        if !logged_in?
            redirect_to "application#home"            
        end
    end

    def create
        # binding.pry
        # user_params[:admin] == "0" ? user_params[:admin] = false : user_params[:admin] = true
        # binding.pry
        @user = User.new(user_params)
        
        if @user.save
            session[:user_id] = @user.id
            user_params[:admin] == "0" ? @user.update(admin: false) : @user.update(admin: true)
            # binding.pry
            redirect_to @user
        end
    end

    def edit

    end

    def update
        # binding.pry
        params.permit(:attraction_id)
        @attraction = Attraction.find_by_id(params[:attraction_id])
        @ride = Ride.create(user_id: @user.id, attraction_id: @attraction.id)
        # binding.pry
        redirect_to user_path(@user)
        
        # attraction = Attraction.find_by(name: params[:name])
        # 
        # if ride.take_ride.include?("Sorry")
        #     redirect_to @user
        # else
            # @user.update(
            #     tickets: (@user.tickets -= attraction.tickets), 
            #     nausea: (@user.nausea += attraction.nausea_rating),
            #     happiness: (@user.happiness += attraction.happiness_rating)
            # )
            # ride.take_ride
            # ride.take_ride
            
        # end
    end

    private

    def user
        @user = User.find_by_id(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation, :height, :nausea, :tickets, :happiness, :admin)
    end
    
    def logged_in?
        session[:user_id]
      end
end
