class JobType < ActiveRecord::Base

  has_many :jobs, :dependent => :destroy

  validates :type_name, :type_description, :presence => true
  
end
