class UserIdeas < ActiveRecord::Base
  attr_accessible :idea, :idea_name, :name, :email, :password, :bio, :password_confirmation, :user_id, :content
  belongs_to :user
  belongs_to :ideas
end
