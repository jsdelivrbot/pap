class Flat < ApplicationRecord
  belongs_to :users

      validates :title, presence:true
      validates :area, presence:true, numericality: true
      # validates :zip, presence:true, format: { with: /\A((0[1-9])|([1-8][0-9])|(9[0-8]|(2A)|(2B))[0-9]{3})\z/, message: "only french zip code" }
      validates :price, presence:true
      validates :availability, presence:true
      validates :rooms, presence:true, numericality: {other_than: 0, only_integer: true}
      validates :category, presence:true
end
