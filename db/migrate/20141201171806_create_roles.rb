class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.text :description

      t.timestamps
    end

    Role.create(:name => "Admin", :description => "Admin Role")
    Role.create(:name => "Company", :description => "Employer Role")
    Role.create(:name => "Job Seeker", :description => "Employee Role")

  end

end
