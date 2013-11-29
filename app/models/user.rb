class User < ActiveRecord::Base
	has_many :friends_lists
	has_many :friends, :through => :friends_lists
	has_many :posts
	has_many :comments
	has_many :messages

	#attr_accessible :email, :password, :password_confirmation
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
