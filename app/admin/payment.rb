ActiveAdmin.register Payment do
  menu parent: "Student Management"

  filter :payment_date
  #filter :student_id do |student|
  #  payment.students.name
  #end

  index do
    column :receipt_no
    column :payment_date
    column ("Payment amount") {|amount| number_to_currency amount.payment_amount, unit: "Ksh. "}
    column ("Payment by") do |payment|
      payment.student.name.upcase
    end
    column ("Payment for") do |payment|
      payment.course.name.upcase
    end
    default_actions
  end

  form do |f|
    f.inputs "Enter payment details" do
      f.input :receipt_no, label: "Payment receipt no.", hint: "The receipt number tallying with the student's payment..."
      f.input :payment_amount, label: "Payment amount(Ksh.)"
      f.input :student_id, as: :select, collection: Student.order("name ASC")
      f.input :course_id, as: :select, collection: Course.order("name ASC")
      f.input :payment_date, as: :datepicker, start_date: Date.today, end_date: Date.today+365, hint: "Click to select payment date..."
    end
    f.buttons
  end
end
