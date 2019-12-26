class UsersController < ApplicationController
    def index
        @users = User.paginate(page: params[:page], per_page: 5)
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          flash[:positive] = "Welcome to the chatroom #{@user.username}"
          redirect_to user_path(@user)
        else
          render 'new'
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:positive] = " User successfully updated"
            redirect_to user_path(@user)
        else
            render 'edit'
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end

end
