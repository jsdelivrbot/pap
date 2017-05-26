Flat.destroy_all

title = ["Super big flat", "Great house in Auvergne", "Amazing caban in Lyon city center", "Live in a dream cavern"]
area = (10..500).to_a.sample.to_s
rooms = [2,3,4,5,6,7]
category = ["flat", "farm", "cavern", "castle"]
cities = %w(Paris Lyon Bordeaux Monaco Saint-Etienne Montlucon Nice Toulouse Clermont-Ferrand)

20.times do |i|
  puts "new flat"
  Flat.create!(
    title: title.sample,
    area: (10..500).to_a.sample.to_s,
    address: cities.sample,
    zip: Faker::Address.postcode,
    price: (80000..500000).to_a.sample.to_s,
    availability: true,
    rooms: rooms.sample,
    category: category.sample,
    user_id: 1,
  )
end

url = "http://lorempixel.com/800/600/city/"

Flat.all.each do |flat|
  random = rand(100)
  randomb = rand(100)

  flat.photo_urls = ["#{url}?#{random}","#{url}?#{randomb}"]
  flat.save
  puts "photo added"
end
