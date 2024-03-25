class CreateDeposits < ActiveRecord::Migration[7.1]
  def change
    create_table :deposits do |t|
      t.string :date_of_deposit
      t.decimal :amount, precision: 8, scale: 2
      t.references :tradeline, null: false, foreign_key: true

      t.timestamps
    end
  end
end
