class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.belongs_to :invoice
      t.belongs_to :parcel
      t.integer :quantity, limit: 1
      t.integer :price
      t.timestamps
    end
  end
end
