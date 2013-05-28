class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.text :tags
      t.text :markup
      t.string :description
      t.text :collaborators

      t.timestamps
    end
  end
end
