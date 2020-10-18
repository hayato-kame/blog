class ApplicationController < ActionController::Base
  
  # moduleをMix-in  取り込む logged_in?メソッドはこの一行が無いと使えない
  include SessionsHelper
  
  private 
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url # redirect_toメソッドのときにはprefix_path は使わないで、prefix_urlを使う決まり
    end 
  end 
  
end
