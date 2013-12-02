class Message < ActiveRecord::Base
	belongs_to :user

  scope :sent, where(:sent => true)
  scope :received, where(:sent => false)
end
