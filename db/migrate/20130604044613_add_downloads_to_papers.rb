class AddDownloadsToPapers < ActiveRecord::Migration
  def change
    add_column :papers, :downloads, :integer
  end
end
