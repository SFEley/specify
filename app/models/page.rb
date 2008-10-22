class Page < ActiveRecord::Base
  acts_as_nested_set
  
  validates_presence_of :title
  validates_uniqueness_of :title
end
