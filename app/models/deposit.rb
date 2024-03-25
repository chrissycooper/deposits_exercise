class Deposit < ApplicationRecord
  belongs_to :tradeline

  #validates deposit amount is less than tradeline balance
  #validates :amount, comparison: {less_than: :outstanding_balance}
end
