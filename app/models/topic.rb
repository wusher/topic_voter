class Topic < ActiveRecord::Base
  validates :body, :presence => true, 
                    :length => { :minimum => 20 }
  validates :title, :presence => true,
                    :length => { :minimum => 5 } 
  has_many :votes

  def self.pending
    where( :presented_on => nil ).order('created_at desc')
  end 

  def self.scheduled
    where( 'presented_on >= ?', Time.now).order('presented_on desc' )  
  end 

  def self.completed 
    where( 'presented_on < ?', Time.now).order('presented_on desc' )  
  end 

  def voted_by?(user)
    votes.where(:user_id => user.id).count > 0
  end 

  def computed_score
    all_votes = Vote.where(:topic_id => id)
    total = 0
    all_votes.each do |vote|
      total += vote.value == true  ? 3 : -1
    end 
    total = 0 unless total > 0
    total
  end 

end
