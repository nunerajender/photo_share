class UsersController < ApplicationController
before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :subscribing, :subscribers]

def subscribing
    @title = "subscribing"
    @user  = User.find(params[:id])
    @users = @user.subscribing.paginate(page: params[:page])
    render 'show_subscribe'
  end

  def subscribers
    @title = "subscribers"
    @user  = User.find(params[:id])
    @users = @user.subscribers.paginate(page: params[:page])
    render 'show_subscribe'

end
