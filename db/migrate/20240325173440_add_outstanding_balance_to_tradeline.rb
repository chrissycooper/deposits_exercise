class AddOutstandingBalanceToTradeline < ActiveRecord::Migration[7.1]
  def change
    add_column :tradelines, :outstanding_balance, :decimal, precision: 8, scale: 2
  end
end
