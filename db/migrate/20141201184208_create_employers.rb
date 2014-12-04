class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|

      t.integer :user_id
      t.string :company_name
      t.string :website_url
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
