class Employee < ActiveRecord::Base
  belongs_to :user

  has_many :applied_jobs, :dependent => :destroy
  has_many :jobs, :through => :applied_jobs

  validates :user_id, :ph_number, :pin_code, :percentage, numericality: { only_integer: true }
  validates :Fname, :Lname, :dob, :gender, :email, :state, :city, :address, :qualification, :univercity, :presence => true

end
