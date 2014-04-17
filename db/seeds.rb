require 'faker'

# Create Students
20.times do
  Student.create!(
    first_name:            Faker::Name.first_name,
    last_name:             Faker::Name.last_name,
    email:                 Faker::Internet.email,
    bio:                   Faker::Lorem.paragraph(8),
    image_url:             "http://placekitten.com/g/300/300",
    password:              "12345678",
    password_confirmation: "12345678"
  )
end


# Create Oranizations
10.times do
  samples = Student.all.sample(13)
  president = samples.pop

  Organization.create!(
    name:        Faker::Company.name,
    description: Faker::Lorem.paragraph(8),
    president:   president,
    members:     samples
  )
end



