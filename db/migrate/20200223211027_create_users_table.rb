class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name 
      t.integer :grade_level
      t.string :username
      t.string :password_digest
    end
  end
end
