class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.datetime :payment_date
      t.integer :payment_amount
      t.integer :course_id
      t.integer :student_id

      t.timestamps
    end
  end
end
