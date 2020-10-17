class PasswordsController < ApplicationController
  
  before_action :require_user_logged_in
  
  def show
    redirect_to :account
  end
  
  def edit
    @user = current_user
  end
end
