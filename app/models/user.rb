class User < ActiveRecord::Base
	has_many :friends_lists
	has_many :friends, through:  :friends_lists
	has_many :posts
	has_many :comments
	has_many :messages 
	has_many :received_messages, foreign_key: 'receiver', class_name: 'Message'	
  has_many :sent_messages, foreign_key: 'user_id', class_name: 'Message'	
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end