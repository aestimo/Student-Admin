class Student < ActiveRecord::Base
  attr_accessible :email, :mobile, :name, :national_id, :sex
end
