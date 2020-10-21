class ToppagesController < ApplicationController
  
  # topoagesController  でいきなり　logged_in? メソッド　current_userメソッドが使えるのは、
  # 親クラスで、include SessionsHelper を書いて、モジュールを取り込んでるから(Mix-in)
  
  def index
    if logged_in?
      @entry = current_user.entries.build # form_with用 空のインスタンスを用意する
      @entries = current_user.entries.order(id: :desc).page(params[:page]) # 一覧表示用
      @user = current_user
    end 
  end
end
