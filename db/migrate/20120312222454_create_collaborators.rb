class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.string :first_name
      t.string :last_name
      t.string :website
      t.string :email

      t.timestamps
    end
  end
end
