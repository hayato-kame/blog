class UsersController < ApplicationController
  
  before_action :require_user_logged_in, only: [:index, :show, :edit, :update, :destroy]
  
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(10)
  end

  # countsメソッドはすべてのコントローラで使えるように、ApplicationControllerにprivateなメソッドとして定義してある
  def show
    @user = User.find(params[:id])
    @entries = @user.entries.order(id: :desc).page(params[:page]).per(5)
    
    counts(@user)  # return省略してる
  end


  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else 
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end 
  end


  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)
    if @user.save
      flash[:success] = 'ユーザのプロフィールを更新しました。'
      redirect_to @user
    else 
      flash.now[:danger] = 'ユーザのプロフィールの更新に失敗しました。'
      render "edit"
    end 
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'ユーザは正常に削除されました。'
    redirect_to users_url
  end
  
  
  private 
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end 
  
end
