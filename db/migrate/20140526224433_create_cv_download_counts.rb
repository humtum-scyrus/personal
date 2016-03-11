class CreateCvDownloadCounts < ActiveRecord::Migration
  def change
    create_table :cv_download_counts do |t|
      t.integer :count

      t.timestamps
    end
  end
end
