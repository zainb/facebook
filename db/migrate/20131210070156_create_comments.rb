class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id, index: true
      t.integer :post_id, index: true
      t.text :body

      t.timestamps
    end
  end
end
