class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id, index: true
      t.text :body
      t.integer :receiver
      t.timestamps
    end
  end
end
