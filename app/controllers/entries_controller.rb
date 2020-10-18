class EntriesController < ApplicationController
  
  # コントローラでのコールバックは特に、ActiveRecordコールバックという
  # before_actionコールバックの :require_user_logged_in によって、この EntriesController の全アクションはログインが必須になります。
  before_action :require_user_logged_in
  
  # before_actionコールバックの :correct_user, only: [:destroy] によって、destroy アクションが実行される前に correct_user が実行されます。
  before_action :correct_user, only: [:destroy, :show]
  
  # コールバックによって取得した値が@entryに入ってる
  def show
    return @entry 
    
  end
  
  def create
    @entry = current_user.entries.build(entry_params)
    if @entry.save
      flash[:success] = 'ブログを投稿しました。'
      redirect_to root_url
    else 
      @entrys = current_user.entries.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'ブログの投稿に失敗しました。'
      render 'toppages/index'
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
