ActiveAdmin.register Student do
  menu parent: "Student Management"

  index do
  #  a list of stuff to input
    column :serial_no
    column :name do |student|
      student.name.upcase
    end
    column :email
    column :mobile do |student|
      "0#{student.mobile}"
    end
    default_actions
  end

  filter :serial_no
  filter :name



  show do
  #  what is shown on the individual record
    attributes_table do
     row ("National ID No.") do |student|
       student.national_id
     end
     row :email
     row :mobile
     row :sex
    end
    active_admin_comments
  end

  sidebar "Student's payment information", only: :show do
    table_for (student.courses) do |t|
      t.column ("Payment for"){|course|course.name.upcase}
      t.column ("Balance to pay"){|course|number_to_currency(course.cost - student.payments.where(course_id: course.id).sum(:payment_amount), unit:"Ksh. ")}
    end
  end

  form do |f|
    f.inputs "Enter details" do
      if f.object.new_record?
        f.input :name, label: "Student name"
        f.input :national_id, label: "National ID No."
        f.input :email
        f.input :sex, as: :select, collection: %w{Male Female}
        f.input :mobile, hint: "..omit the first 0...& input in the format 7XXXXXXXX..."
        f.input :serial_no, as: :hidden, value: "JKU-STU-00#{3*rand(1000)}"
      else
        f.input :name, label: "Student name"
        f.input :national_id, label: "National ID No."
        f.input :email
        f.input :sex, as: :select, collection: %w{Male Female}
        f.input :mobile, hint: "..omit the first 0...& input in the format 7XXXXXXXX..."
      end
      f.buttons
    end
  end


end
