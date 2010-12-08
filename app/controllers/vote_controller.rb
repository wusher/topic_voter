class VoteController < ApplicationController
  before_filter :authenticate_user!

  def up
    topic = Topic.find(params[:topic_id])
    vote = current_user.votes.where(:topic_id = topic.id)
    if vote.nil?
      vote = Vote.new
      vote.topic = topic
      vote.user = current_user
    end

    vote.value = true
    vote.save
  end 

  def vote_down
    topic = Topic.find(params[:topic_id])
    vote = current_user.votes.where(:topic_id = topic.id)
    if vote.nil?
      vote = Vote.new
      vote.topic = topic
      vote.user = current_user
    end

    vote.value = false 
    vote.save
  end 

  def delete
    topic = Topic.find(params[:topic_id])
    vote = current_user.votes.where(:topic_id = topic.id)
    if not vote.nil?
      vote.destroy
    end

  end 
end
