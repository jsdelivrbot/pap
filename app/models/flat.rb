class Flat < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :address_changed?


  has_attachments :photos

  CHOICE_CATEGORY = ["cavern", "flat", "farm", "castle"]

  validates :title, presence:true
  validates :area, presence:true, numericality: {greater_than_or_equal_to: 1, only_integer: true}
  validates :price, presence:true, numericality: {greater_than_or_equal_to: 1, only_integer: true}
  validates :rooms, presence:true, numericality: {greater_than_or_equal_to: 1, only_integer: true}
  # validates :zip, presence:true, format: { with: /\A((0[1-9])|([1-8][0-9])|(9[0-8]|(2A)|(2B))[0-9]{3})\z/, message: "only french zip code" }
  validates :availability, presence:true
  validates :category, presence:true, inclusion: { in: CHOICE_CATEGORY }

end
