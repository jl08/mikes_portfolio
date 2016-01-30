class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :section, null: false
      t.string :title, null: false
      t.string :description, null: false

      t.timestamps null: false
    end
  end
end
