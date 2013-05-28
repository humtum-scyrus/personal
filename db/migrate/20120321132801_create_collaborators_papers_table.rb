class CreateCollaboratorsPapersTable < ActiveRecord::Migration
  def change
    create_table :collaborators_papers, :id => false do |t|
      t.integer :collaborator_id
      t.integer :paper_id
    end
  end
end
