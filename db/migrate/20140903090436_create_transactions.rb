class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :reference
      t.decimal :debit, precision: 7, scale: 2
      t.decimal :credit, precision: 7, scale: 2
      t.integer :user_id

      t.timestamps
    end
  end
end
