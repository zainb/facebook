class CreateFriendsLists < ActiveRecord::Migration
  def change
    create_table :friends_lists do |t|
      t.integer :friend_id, index: true

      t.timestamps
    end
  end
end
