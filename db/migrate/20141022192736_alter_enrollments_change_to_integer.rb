class AlterEnrollmentsChangeToInteger < ActiveRecord::Migration
  def change
  	remove_column :enrollments, :course_id
  	remove_column :enrollments, :user_id
  	add_column :enrollments, :course_id, :integer
  	add_column :enrollments, :user_id, :integer

  	add_index :enrollments, [:course_id, :user_id]
  	add_index :enrollments, :user_id
  end
end
