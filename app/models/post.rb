class Post < ActiveRecord::Base
	belongs_to :user
	validates :body, presence: true
	has_many :comments, :dependent => :destroy, order: 'created_at DESC'
end
