class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => 'about'



  def about
    flash[:notice] = 'notice'
    flash[:alert] = 'alert'
  end

  def secure
    flash[:notice] = 'secure notice'
    flash[:alert] = 'secure alert'
  end

end
