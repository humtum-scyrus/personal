class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :citation

      t.timestamps
    end
  end
end
