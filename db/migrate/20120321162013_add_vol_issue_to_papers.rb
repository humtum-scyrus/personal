class AddVolIssueToPapers < ActiveRecord::Migration
  def change
    add_column :papers, :volume, :integer
    add_column :papers, :issue, :integer
    add_column :papers, :page_nums, :string
  end
end
