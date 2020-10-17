class AccountsController < ApplicationController
  
  before_action :require_user_logged_in
  
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    @user.assign_attributes(account_params)
    if @user.save
      flash[:success] = 'ユーザ情報を更新しました。'
      redirect_to :account
    else 
      flash.now[:danger] = 'ユーザ情報の更新に失敗しました。'
      render "edit"
    end 
  end
  
  private 
  
  #Strong Parameter
  def account_params
    params.require(:user).permit(:name, :email)
  end 
  
end
