class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.references :section, null: false

      t.timestamps null: false
    end
  end
end
