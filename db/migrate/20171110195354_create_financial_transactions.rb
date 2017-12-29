class CreateFinancialTransactions < ActiveRecord::Migration
  def change
    create_table :financial_transactions do |t|
      t.string :description
      t.string :transaction_type
      t.float :amount, default: 0.00
      t.boolean :voided, default: false
      t.timestamps null: false
    end
  end
end
