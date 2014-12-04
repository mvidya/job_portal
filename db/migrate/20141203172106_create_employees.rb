class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :user_id
      t.string :Fname
      t.string :Lname
      t.date :dob
      t.string :gender
      t.string :email
      t.integer :ph_number
      t.string :state
      t.string :city
      t.text :address
      t.integer :pin_code
      t.string :qualification
      t.string :univercity
      t.integer :percentage

      t.timestamps
    end
  end
end
