Flat.all.each do |flat|
  flat.destroy
end


title =["big flat", "small flat", "big house", "small house"]
area = (10..500).to_a.sample.to_s
rooms = [2,3,4,5,6,7]
category = ["flat", "farm", "castle", "cavern"]

20.times do |i|
  puts "new flat"
  Flat.create!(
    title: title.sample,
    area: (10..500).to_a.sample.to_s,
    address: Faker::Address.city,
    zip: Faker::Address.postcode,
    price: (80000..500000).to_a.sample.to_s,
    availability: true,
    rooms: rooms.sample,
    category: category.sample,
    user_id: 3,
    )
end

url = 'http://lorempixel.com/800/600/city/'

Flat.all.each do |flat|
  ramdom = rand(100)
  ramdomb = rand(100)

  flat.photo_urls = ["#{url}?#{ramdom}","#{url}?#{ramdomb}"]
  flat.save
  puts "photo added"
end
