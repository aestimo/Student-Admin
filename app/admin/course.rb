ActiveAdmin.register Course do
  menu parent: "Course Management"
  config.per_page = 10

  filter :course_code
  filter :name

  index do
  #  a list of the courses available
    column :course_code
    column ("Course name") do |course|
      course.name.upcase
    end
    column ("Course cost") {|course| number_to_currency course.cost, unit: "Ksh. "}
    default_actions
  end

  sidebar "Course-Unit details", only: :show do
    table_for (course.units) do |e|
      e.column ("Units for this course"){|unit| auto_link unit.name}
    end
  end

  form do |f|
    f.inputs "Enter details" do
      if f.object.new_record?
        f.input :course_code, as: :hidden, value: "JKU-COURSE-#{rand(100)}"
        f.input :name, hint: "The name of the course..."
        f.input :cost, hint: "How much the course costs...", label: "Course cost (Ksh.)"
        f.inputs "Enter course-unit details" do
          f.has_many :units do |i|
            i.input :unit_code, as: :hidden, value: "JKU-UNIT-#{rand(32..588)}"
            i.input :name, hint: "...the unit's name..."
          end
        end
      else
        f.input :name, hint: "The name of the course..."
        f.input :cost, hint: "How much the course costs...", label: "Course cost (Ksh.)"
        f.inputs "Enter course-unit details" do
          f.has_many :units do |i|
            i.input :name, hint: "...the unit's name..."
          end
        end
      end

    f.buttons
  end
  end

end
