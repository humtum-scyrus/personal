class CreateEssays < ActiveRecord::Migration
  def change
    create_table :essays do |t|
      t.string :description
      t.text :tags
      t.text :markup

      t.timestamps
    end
  end
end
