class CreateFriendsLists < ActiveRecord::Migration
  def change
    create_table :friends_lists do |t|
      t.integer :friend_id

      t.timestamps
    end
  end
end
