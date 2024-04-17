# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
specialties = ['Cardiovascular', 'MBBS', 'Neurology', 'Orthopedics', 'Pediatrics', 'Psychiatry', 'Dermatology', 'Gastroenterology', 'Infectious Diseases', 'Internal Medicine', 'Oncology', 'Ophthalmology', 'Otolaryngology (ENT)', 'Radiology', 'Surgery', 'Urology']

30.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'password', # or use Faker to generate a password
    role: 'doctor',
    speciality: specialties.sample,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end