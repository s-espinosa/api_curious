class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(session[:token])
  end
end
