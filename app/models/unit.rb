class Unit < ActiveRecord::Base
  attr_accessible :name, :unit_code
  belongs_to :course
end
