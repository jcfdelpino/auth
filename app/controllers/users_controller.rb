class UsersController < ApplicationController
  def show
    @user = User.find(params["id"])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params["user"])
    # where is password: 
    plain_text_password = params["user"] ["password"]
    # line below adds encryption step --> puppies
    @user.password = BCrypt::Password.create(plain_text_password)
    @user.save
    redirect_to "/users/#{@user.id}"
  end
end
