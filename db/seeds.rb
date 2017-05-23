
zip = ["75001", "75002", "75003", "75004", "75005"]
title =["big flat", "small flat", "big house", "small house"]
area =[80, 40, 30, 50, 100]
price =[100, 200, 300, 400]
rooms = [2,3,4,5]
category = ["flat", "farm", "castle", "cavern"]

10.times do |i|
  puts "new flat"
  Flat.create!(
    title: title.sample,
    area:  area.sample,
    zip: zip.sample,
    price: price.sample,
    availability: true,
    rooms: rooms.sample,
    category: category.sample,
    user_id: 1
    )
end
