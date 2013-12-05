class User < ActiveRecord::Base
	has_many :friends_lists
	has_many :friends, :through => :friends_lists
	has_many :posts
	has_many :comments
	has_many :messages 
	has_many :received_messages, foreign_key: 'to_from', class_name: 'Message'	#attr_accessible :email, :password, :password_confirmation
  has_many :sent_messages, foreign_key: 'user_id', class_name: 'Message'	#attr_accessible :email, :password, :password_confirmation
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
