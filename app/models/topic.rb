class Topic < ActiveRecord::Base
  validates :presentor, :presence => true
  validates :body, :presence => true, 
                    :length => { :minimum => 20 }
  validates :title, :presence => true,
                    :length => { :minimum => 5 } 
  has_many :votes


  def voted_by?(user)
    votes.where(:user_id => user.id).count > 0
  end 

  def total_score
    total = 0
    votes.each do |vote|
      total += vote.value ? 3 : -1
    end 
    total = 0 unless total > 0
    total
  end 

end
