class Employee < ActiveRecord::Base

  belongs_to :user

  has_many :applied_jobs, :dependent => :destroy
  has_many :jobs, :through => :applied_jobs

  validates :user_id, :ph_number, :pin_code, :percentage, numericality: { only_integer: true }
  validates :Fname, :Lname, :dob, :gender, :email, :state, :city, :address, :qualification, :univercity, :presence => true

  has_attached_file :document

  validates :document, :attachment_presence => true

  # Validate content type
  validates_attachment_content_type :document, :content_type => ["application/download","application/vnd.ms-excel",     
   "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
   "application/msword", 
   "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
   "text/plain"]

 end
