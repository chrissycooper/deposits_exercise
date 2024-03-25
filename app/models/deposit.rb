class Deposit < ApplicationRecord
  belongs_to :tradeline

  #validates deposit amount is less than tradeline balance
end
