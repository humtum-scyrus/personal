class Update < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.text :body
      t.datetime :date

      t.timestamps
    end
  end
end
