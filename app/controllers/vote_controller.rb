class VoteController < ApplicationController
  before_filter :authenticate_user!

  def up
    topic = Topic.find(params[:topic_id])
    vote = current_user.votes.where(:topic_id => topic.id).first
    if vote.nil?
      vote = Vote.new
      vote.topic = topic 
      vote.user = current_user
    end
    
    if vote.value != true then 
      vote.value = true
      vote.save
    else 
      vote.destroy
    end

    nt = Topic.find(params[:topic_id])
    nt.score = nt.computed_score
    nt.save

    respond_to do |format|
      format.js { render :json => nt.computed_score, :status => :ok }
    end 
  end 

  def down 
    topic = Topic.find(params[:topic_id])
    vote = current_user.votes.where(:topic_id => topic.id).first
    if vote.nil?
      vote = Vote.new
      vote.topic = topic
      vote.user = current_user
    end
    if vote.value != false then 
      vote.value = false 
      vote.save
    else 
      vote.destroy
    end if 

    nt = Topic.find(params[:topic_id])
    nt.score = nt.computed_score
    nt.save

    respond_to do |format|
      format.js { render :json => nt.computed_score, :status => :ok }
    end 
  end 

end
