class CreateInfomations < ActiveRecord::Migration[6.0]
  def change
    create_table :infomations do |t|
      t.integer :refuel, null: false
      t.integer :ODO
      t.integer :TRIP
      t.integer :range, null: false
      t.integer :cost, null: false
      t.integer :FE
      t.integer :avrage_FE
      t.date :refuelday
      t.string :fueltype, null: false
      t.references :user, foreign_key: true
      t.references :car, foreign_key: true
      t.timestamps
    end
  end
end
