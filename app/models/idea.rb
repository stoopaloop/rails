class Idea < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :user_ideas
  attr_accessible :idea, :idea_name, :name, :email, :password, :bio, :password_confirmation, :user_id, :content
end
