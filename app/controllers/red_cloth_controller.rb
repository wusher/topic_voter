class RedClothController < ApplicationController
  
  def textilize
    text = params[:text]
    result = make_textilize( text )

    respond_to do |format|
      format.js { render :json => result, :status => :ok }
    end 
  end 

  private 

  def make_textilize(text, *options)
    options ||= [:hard_breaks]
    if text.blank?
      ''
    else 
      textilized = RedCloth.new(text,options)
      textilized.to_html
    end
  end


end
