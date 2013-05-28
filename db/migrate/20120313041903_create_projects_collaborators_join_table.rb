class CreateProjectsCollaboratorsJoinTable < ActiveRecord::Migration
  def change
    create_table :collaborators_projects, :id => false do |t|
      t.integer :collaborator_id
      t.integer :project_id
    end
  end
end
