class CreateFueltypes < ActiveRecord::Migration[6.0]
  def change
    create_table :fueltypes do |t|
      t.string :fuelname, null: false
      t.timestamps
    end
  end
end
