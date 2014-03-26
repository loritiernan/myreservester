class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :phone_number
      t.string :address
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
