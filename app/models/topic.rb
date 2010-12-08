class Topic < ActiveRecord::Base
  validates :presentor, :presence => true
  validates :body, :presence => true, 
                    :length => { :minimum => 20 }
  validates :title, :presence => true,
                    :length => { :minimum => 5 } 
  has_many :votes
end
