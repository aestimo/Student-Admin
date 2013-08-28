class Course < ActiveRecord::Base
  attr_accessible :course_code, :name
  has_many :units, dependent: :destroy
  accepts_nested_attributes_for :units
end
