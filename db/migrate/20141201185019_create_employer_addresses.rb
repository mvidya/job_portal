class CreateEmployerAddresses < ActiveRecord::Migration
  def change
    create_table :employer_addresses do |t|

      t.integer :employer_id
      t.string :country
      t.string :state
      t.string :city
      t.string :contact_person
      t.string :contact_number
      t.string :contact_email
      t.text :full_address

      t.timestamps
    end
  end
end
