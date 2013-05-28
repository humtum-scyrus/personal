class AddTypeToPaper < ActiveRecord::Migration
  def change
    add_column :papers, :papertype, :string
  end
end
