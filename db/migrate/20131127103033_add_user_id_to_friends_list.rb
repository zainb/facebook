class AddUserIdToFriendsList < ActiveRecord::Migration
  def change
    add_column :friends_lists, :user_id, :integer, index: true
  end
end
