class AddProjectReferenceToTask < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :project
  end
end
