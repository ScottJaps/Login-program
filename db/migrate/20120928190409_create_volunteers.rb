class CreateVolunteers < ActiveRecord::Migration
  def up
    create_table :volunteers do |t|
      t.string        :name
      t.string        :phoneNumberEmail
      t.string        :program
      t.string        :description
      t.datetime      :time_in
      t.datetime      :time_out
      t.timestamps    
    end
  end
  
  def down
    drop_table :volunteers
  end
end
