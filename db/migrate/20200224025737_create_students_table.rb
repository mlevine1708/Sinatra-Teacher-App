class CreateStudentsTable < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name 
      t.integer :grade_level
      t.integer :user_id 
    end 
  end
end
