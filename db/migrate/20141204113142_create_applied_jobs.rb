class CreateAppliedJobs < ActiveRecord::Migration
  def change
    create_table :applied_jobs do |t|
      t.integer :employee_id
      t.integer :job_id

      t.timestamps
    end
  end
end
