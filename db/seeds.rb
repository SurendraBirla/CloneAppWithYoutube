# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

roles = Role.create!([{ name: "Admin" }, { name: "User" }])

admin_role = Role.find_by(name: "Admin")

User.create!(
  name: "Surendra Birla",
  username: "surendrabirla",
  email: "surendra@gmail.com",
  password: "123456",
  mobile_nu: "3278467329",
  role_id: admin_role.id
)