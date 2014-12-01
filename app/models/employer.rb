class Employer < ActiveRecord::Base
  
  belongs_to :user
  has_many :employer_addresses, :dependent => :destroy
  
end
