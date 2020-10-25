class CreateInfomations < ActiveRecord::Migration[6.0]
  def change
    create_table :infomations do |t|
      t.float :refuel, null: false
      t.float :trip, null: false
      t.float :cost, null: false
      t.date :refuelday, null: false
      t.integer :fueltype_id, null: false
      t.references :user, foreign_key: true
      t.references :car, foreign_key: true
      t.timestamps
    end
  end
end
