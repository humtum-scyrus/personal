class RemoveCollaboratorsFromProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :collaborators
    add_column :projects, :title, :string
  end

  def down
    add_column :projects, :collaborators, :text
    remove_column :projects, :title
  end
end
