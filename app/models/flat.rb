class Flat < ApplicationRecord
  belongs_to :user


  validates :title, presence:true
  validates :area, presence:true, numericality: true
  validates :price, presence:true
  validates :rooms, presence:true, numericality: {other_than: 0, only_integer: true}

end
