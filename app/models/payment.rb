class Payment < ActiveRecord::Base
  attr_accessible :course_id, :payment_amount, :payment_date, :student_id, :receipt_no
  belongs_to :student
  belongs_to :course
end
