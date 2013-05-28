class CreateCollaboratorEssayJoinTable < ActiveRecord::Migration
  def change
    create_table :collaborators_essays, :id => false do |t|
      t.integer :collaborator_id
      t.integer :essay_id
    end
  end
end
