class Employer < ActiveRecord::Base
  
  belongs_to :user
  has_many :jobs, :dependent => :destroy

  validates :user_id, :contact_number, numericality: { only_integer: true }
  validates :company_name, :website_url, :country, :state, :city, :contact_person, :contact_email, :full_address, :presence => true
  
end
