class CreateVolunteers < ActiveRecord::Migration
  def up
    create_table :volunteers do |t|
      t.string        :name
      t.string        :phoneNumber
      t.string        :email
      t.string        :program
      t.datetime      :time_in
      t.datetime      :time_out
      t.timestamps    
    end
  end
  
  def down
    drop_table :volunteers
  end
end
