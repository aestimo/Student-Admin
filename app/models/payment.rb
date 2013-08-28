class Payment < ActiveRecord::Base
  attr_accessible :course_id, :payment_amount, :payment_date, :student_id
end
