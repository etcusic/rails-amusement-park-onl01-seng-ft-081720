class SessionsController < ApplicationController

    def new
        if logged_in?
            redirect_to "/users/#{session[:user_id]}"
        end
    end

    def create
        params.permit(:user, :user_password)
        @user = User.find_by(id: params[:user])
        # binding.pry
        if @user && @user.authenticate(params[:user_password])
            session[:user_id] = @user.id
            redirect_to @user
        else 
            redirect_to 'application#home'
        end
        # if params[:name] && !params[:name].empty?
        #     session[:user_id] = params[:user_id]
        #     redirect_to "/users/#{session[:user_id]}"
        # else
        #     redirect_to '/login'
        # end
    end

    def destroy
        session.destroy
        redirect_to "application#home"
    end

    def logged_in?
        session[:user_id]
    end
end