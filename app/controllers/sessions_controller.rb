class SessionsController < ApplicationController
    before_action :logged_in_redirect, only: [:new, :create]

    def new
    end

    def create
        user = User.find_by(username: params[:session][:username].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:positive] = "You have successfully signed in!"
            redirect_to user_path(user)
        else
            flash.now[:negative] = "Invalid username/password"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:positive] = "Successfully signed out"
        redirect_to login_path
    end

    private

    def logged_in_redirect
        if logged_in?
            flash[:negative] = "You are already logged in"
            redirect_to root_path
        end
    end




end
