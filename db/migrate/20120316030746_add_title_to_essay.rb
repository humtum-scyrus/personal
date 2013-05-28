class AddTitleToEssay < ActiveRecord::Migration
  def change
    add_column :essays, :title, :string
  end
end
