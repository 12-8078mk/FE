class CreateCarUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :car_users do |t|
      t.references :car, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
