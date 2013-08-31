class Student < ActiveRecord::Base
  attr_accessible :email, :mobile, :name, :national_id, :sex, :serial_no
  has_many :payments#, :results
  has_many :courses, through: :payments
  #has_many :courses, through: :results
end
