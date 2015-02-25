class HomeController < ApplicationController
  # GET /
  def index
    @users = User.all
  end

  # GET /search
  def search
    search_email = params[:search][:email]

    # @user = User.where(email: email).first

    # if @user.present?
    #   redirect_to root_path, notice: "找到用戶：#{@user.inspect}"
    # else
    #   redirect_to root_path, alert: "Not found"
    # end

    @user = User.find_by(email: search_email)

    if @user.present?
      redirect_to root_path, notice: "找到用戶：#{@user.inspect}"
    else
      redirect_to root_path, alert: "Not found"
    end
  end
end