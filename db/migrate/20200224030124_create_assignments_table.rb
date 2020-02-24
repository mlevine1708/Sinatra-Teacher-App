class CreateAssignmentsTable < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :title 
      t.string :subject 
      t.integer :user_id
    end
  end
end
