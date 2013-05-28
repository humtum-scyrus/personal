class AddFeaturedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :is_featured, :boolean
  end
end
