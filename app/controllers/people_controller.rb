class PeopleController < ApplicationController
  before_filter :authenticate_admin!

  def index 
    @users = User.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users } 
    end
  end 
    

  # GET /topics/1
  # GET /topics/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def edit 
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end 

  def update 
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(people_path , :notice => 'password was successfully changed.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end 

  def clear_votes 

    @user = User.find(params[:person_id])
    @user.votes.each do |vote|
      vote.destroy 
    end 
    @user.save

    respond_to do |format|
      format.html { redirect_to(people_url, :notice => "votes for user #{ @user.email } have been cleared" ) }
      format.xml  { head :ok }
    end 
  end 

  # DELETE /topics/1
  # DELETE /topics/1.xml
  def destroy
    user = User.find(params[:id])
    respond_to do |format|
      if user.votes.count < 1  then 
        user.destroy
        format.html { redirect_to(people_url, :notice => "user #{ user.email } was successfully deleted.") }
        format.xml  { head :ok }
      else 
        error_msg = "delete fail! you cannot delete #{ user.email } because that user still has votes in the system. "
        format.html { redirect_to(people_url, :alert => error_msg) } 
        format.xml  { render :xml => error_msg, :status => :unprocessable_entity }
      end 
    end 
  end



end
