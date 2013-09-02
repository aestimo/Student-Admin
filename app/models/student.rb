class Student < ActiveRecord::Base
  attr_accessible :email, :mobile, :name, :national_id, :sex, :serial_no
  has_many :payments
  has_many :results
  has_many :courses, through: :payments
  has_many :courses, through: :results
end
