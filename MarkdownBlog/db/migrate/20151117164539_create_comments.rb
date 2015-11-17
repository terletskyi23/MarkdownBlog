class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false, default: ""
      t.integer :user_id, null: false
      t.integer :post_id, null: false

      t.timestamps null: false
    end

    add_index :comments, [:user_id, :post_id], :unique => true

    validates :user_id, :post_id, numericality: true
    validates :user_id, :post_id, :uniqueness => true
    validates :user_id, :post_id, :body, :presence => true
  end
end
