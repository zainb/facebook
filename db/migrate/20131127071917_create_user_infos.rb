class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.string :name
      t.string :sex
      t.string :merital_status
      t.datetime :date_of_birth
      t.string :residence
      t.integer :phone_number

      t.timestamps
    end
  end
end
