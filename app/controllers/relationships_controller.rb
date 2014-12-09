class RelationshipsController < ApplicationController

  before_action :logged_in_user

  def create
    @user = User.find(params[:subscribed_id])
    current_user.subscribe(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).subscribed
    current_user.unsubscribe(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end
