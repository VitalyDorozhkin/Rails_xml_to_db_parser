class CreateParcels < ActiveRecord::Migration[6.0]
  def change
    create_table :parcels do |t|
      t.string :name
      t.bigint :code

      t.timestamps
    end
  end
end
