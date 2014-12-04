class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :employer_id
      t.integer :job_type_id
      t.date :job_posted_on
      t.date :job_expires_on
      t.integer :salary
      t.string :functional_area
      t.integer :experience

      t.timestamps
    end
  end
end
