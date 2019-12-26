class SessionsController < ApplicationController
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
        redirect_to root_path
    end



end
