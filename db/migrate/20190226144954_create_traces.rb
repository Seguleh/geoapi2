class CreateTraces < ActiveRecord::Migration[5.2]
  def change
    create_table :traces do |t|

      t.float :latitude,  null: false
      t.float :longitude, null: false

      t.timestamps
    end
  end
end
