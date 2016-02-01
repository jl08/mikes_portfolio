class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :description
      t.attachment :image
      t.references :project

      t.timestamps null: false
    end
  end
end
