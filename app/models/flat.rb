class Flat < ApplicationRecord
  belongs_to :users

      validates :title, presence:true
      validates :description
      validates :area, presence:true, numericality: true
      validates :address
      validates :zip, presence:true, format: { with: '/^((0[1-9])|([1-8][0-9])|(9[0-8]|(2A)|(2B))[0-9]{3})$/', message: "only french zip code" }
      validates :price, presence:true
      validates :availability
      validates :rooms, presence:true, numericality: {other_than: 0, only_integer: true}
      validates :type, presence:true
end
