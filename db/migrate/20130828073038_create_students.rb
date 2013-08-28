class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.integer :national_id
      t.string :email
      t.integer :mobile
      t.string :sex

      t.timestamps
    end
  end
end
