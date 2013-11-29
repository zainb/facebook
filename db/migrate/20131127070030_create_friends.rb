class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :user_name

      t.timestamps
    end
  end
end
