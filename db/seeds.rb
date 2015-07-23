10.times do
  Subscriber.create!(email: Faker::Internet.email, deleted: [true, false].sample)
end
