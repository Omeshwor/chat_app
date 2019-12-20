class UsersController < ApplicationController
  def index
      @users = User.paginate(page: params[:page], per_page: 5`)
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end
end
