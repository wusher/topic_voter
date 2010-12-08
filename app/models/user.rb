class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #,:confirmable
         

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :votes


  def voted_for?(topic)
    votes.where(:topic_id => topic.id, :value => true).count > 0
  end 
  def voted_against?(topic)
    votes.where(:topic_id => topic.id, :value => false).count > 0
  end 
 
end
