# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Complaint.destroy_all
Company.destroy_all
User.destroy_all


20.times do |i|
    Company.create(
        name: Faker::Company.name
    )
end

30.times do |j|
    User.create(
    email: Faker::Internet.email,
    password: '123456'
    )
end

250.times do |k|
    Complaint.create(
    detail: Faker::JapaneseMedia::OnePiece.quote,
    company: Company.order("RANDOM()").first,
    user: User.order("RANDOM()").first
    )
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

