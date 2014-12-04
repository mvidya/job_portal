class CreateJobTypes < ActiveRecord::Migration
  def change
    create_table :job_types do |t|
      t.string :type_name
      t.text :type_description

      t.timestamps
    end
  end
end
