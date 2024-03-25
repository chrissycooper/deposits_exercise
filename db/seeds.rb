# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

home_loan = Tradeline.create(name: "Home Loan", amount: 196710.00)
car_loan = Tradeline.create(name: "Car Loan", amount: 36685.00)
personal_loan = Tradeline.create(name: "Personal Loan", amount: 4786.00)

