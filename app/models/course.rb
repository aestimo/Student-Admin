class Course < ActiveRecord::Base
  attr_accessible :course_code, :name, :units_attributes, :cost
  has_many :units, dependent: :destroy
  accepts_nested_attributes_for :units
  has_many :payments
  has_many :results
  has_many :students, through: :payments
  has_many :students, through: :results
end
