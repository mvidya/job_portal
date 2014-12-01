class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|

      t.integer :user_id
      t.string :company_name
      t.string :website_url

      t.timestamps
    end
  end
end
