class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :poster, null: false
      t.string :title, null: false
      t.string :body, null: false

      t.timestamps
    end
  end
end
