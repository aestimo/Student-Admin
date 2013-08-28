class AddCourseIdToUnit < ActiveRecord::Migration
  def change
    add_column :units, :course_id, :integer
  end
end
