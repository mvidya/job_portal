class AddDocumentColumnsToEmployees < ActiveRecord::Migration
 def self.up
  add_attachment :employees, :document
end

def self.down
  remove_attachment :employees, :document
end
end
