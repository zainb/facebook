class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.text :body
      t.boolean :sent
      t.integer :to_from

      t.timestamps
    end
  end
end
