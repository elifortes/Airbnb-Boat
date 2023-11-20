class CreateBoats < ActiveRecord::Migration[7.1]
  def change
    create_table :boats do |t|
      t.string :title
      t.text :description
      t.string :photo
      t.decimal :price_per_unit
      t.integer :reviews
      t.string :captain_name
      t.integer :guest_capacity
      t.datetime :availability_from
      t.datetime :availability_to
      t.string :boat_maker_name
      t.string :boat_model
      t.string :boat_size
      t.integer :year_made
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
