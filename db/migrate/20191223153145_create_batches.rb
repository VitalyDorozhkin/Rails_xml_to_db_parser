class CreateBatches < ActiveRecord::Migration[6.0]
  def change
    create_table :batches do |t|
      t.date :date
      t.uuid :guid

      t.timestamps
    end
  end
end
