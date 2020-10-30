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
        binding.pry
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        end
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
