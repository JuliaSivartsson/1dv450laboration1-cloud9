class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      
      t.string :name
      t.string :description
      t.string :apikey
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
