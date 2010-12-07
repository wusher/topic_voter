class HomeController < ApplicationController
  def about
    flash[:notice] = 'notice'
    flash[:alert] = 'alert'
  end

end
