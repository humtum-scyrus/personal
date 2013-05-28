class AddAuthOrderToPapers < ActiveRecord::Migration
  def change
    add_column :papers, :self_author_order, :integer
  end
end
