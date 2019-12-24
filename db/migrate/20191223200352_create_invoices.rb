class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.belongs_to :batch
      t.belongs_to :company
      t.integer :operation_number
      t.date :operation_date
      t.timestamps
    end
  end
end
