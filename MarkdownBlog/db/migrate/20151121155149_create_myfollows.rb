class CreateMyfollows < ActiveRecord::Migration
  def change
    create_table :myfollows do |t|
      t.integer :follower_id
      t.integer :following_id

      t.timestamps null: false
    end

    add_index :myfollows, "follower_id"
    add_index :myfollows, "following_id"
  end
end
