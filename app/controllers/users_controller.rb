class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        if user = User.create(user_params)
            if params[:user][:admin] == "1"

                user.admin = true
                user.save
            end
            session[:user_id] = user.id
            redirect_to user_path(user)
        else  
            render :new
        end  
    end

    def show
        @user = User.find_by(id: params[:id])
        if !session[:user_id]
            redirect_to root_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :height, :tickets)
    end
end