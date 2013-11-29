class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :recieved_by
      t.integer :user_id

      t.timestamps
    end
  end
end
