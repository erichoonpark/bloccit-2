class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      #A model that creates a posts table that stores the title and body
      t.timestamps null: false
    end
  end
end
