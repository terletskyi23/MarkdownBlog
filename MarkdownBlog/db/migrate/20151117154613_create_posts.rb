class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false, default: ""
      t.text :text, null: false, default: ""
      t.integer :user_id, null: false

      t.timestamps null: false
    end
    add_index :posts, [:user_id, :title], :unique => true

    validates :user_id, numericality: true
    validates :user_id, :title, :uniqueness => true
    validates :user_id, :title, :presence => true
  end
end
