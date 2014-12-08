class CreateAdminUser < ActiveRecord::Migration
  def self.up
    User.create(:email => "vidya2255m@gmail.com", :role_id => Role.find_by(name: "Admin").id, :password => "vidya2255m")
  end

  def self.down
    User.find_by(:email => "vidya2255m@gmail.com", :role_id => Role.find_by(name: "Admin").id).destroy
  end
end
