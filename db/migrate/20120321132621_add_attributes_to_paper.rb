class AddAttributesToPaper < ActiveRecord::Migration
  def change
    add_column :papers, :year, :integer
    add_column :papers, :venue, :string
    add_column :papers, :accept_rate, :double
    add_column :papers, :title, :string
  end
end
