class EntriesController < ApplicationController
  
  # コントローラでのコールバックは特に、ActiveRecordコールバックという
  # before_actionコールバックの :require_user_logged_in によって、この EntriesController の全アクションはログインが必須になります。
  before_action :require_user_logged_in
  
  # before_actionコールバック　　:destroy, :edit, :updateアクションが実行される前に correct_user が実行されます。
  before_action :correct_user, only: [:destroy, :edit, :update]
  
  
  def show
    
    @entry = current_user.entries.find_by(id: params[:id])
    
    unless @entry
      # ネストされたリソースのブログ記事へ
      @user = User.find(params[:user_id])
      @entry = @user.entries.find(params[:id])
      
    end 
  end
  
  def create
    @entry = current_user.entries.build(entry_params)
    if @entry.save
      flash[:success] = 'ブログを投稿しました。'
      redirect_to root_url
    else 
      @entries = current_user.entries.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'ブログの投稿に失敗しました。'
  
      render 'toppages/index'
    end 
  end

 
  def edit
    return @entry
  end
  
  # before_actionコールバックで、 @entryには、値が入ってる
  def update
    @entry.assign_attributes(entry_params)
    if @entry.save
      flash[:success] = '記事を変更しました。'
      redirect_to @entry
    else 
      flash.now[:danger] = '記事を変更できませんでした。'
      render "edit"
    end
  end 

  # @entryには、correct_userコールバックで検索してきたオブジェクトが入っています。
  def destroy
    @entry.destroy
    flash[:success] ="ブログを削除しました。"
    redirect_back(fallback_location: root_path)
  end
  
  
  private
  
  def entry_params
    params.require(:entry).permit(:title, :body)
  end 
  
  def correct_user
    @entry = current_user.entries.find_by(id: params[:id])
    unless @entry
      redirect_to root_url
    end 
  end
  
end
