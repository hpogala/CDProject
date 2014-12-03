class CreateCourses < ActiveRecord::Migration
   def change
    create_table :courses do |t|
      t.string :code
      t.string :name
      t.string :professor
      t.references 'department'
      t.timestamps
    end
  end
  
end
