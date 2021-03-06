class Api::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      Bookshelf.create(name: "Read", creator_id: @user.id)
      Bookshelf.create(name: "Currently Reading", creator_id: @user.id)
      Bookshelf.create(name: "Want to Read", creator_id: @user.id)
      render '/api/users/show'
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end
