class UsersController < ApplicationController

    def create
        @user = User.new(user_params)
        if @user.save
            log_in_user!(@user)
            @users = User.all
            debugger
            redirect_to users_url
        else
            flash.now[:errors]= @user.errors.full_messages
            render :new,  users: @users
        end
    end

    def show
        @user = User.find_by(id: user_params(:id))
    end

    def new
        @user = User.new
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end