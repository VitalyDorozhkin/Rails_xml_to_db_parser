class Position < ApplicationRecord
  validates :quantity, presence: true, numericality: { minimum: 1, maximum: 50 }
  validates :price, presence: true, numericality: { minimum: 0, maximum: 90_000 }
  belongs_to :invoice
  belongs_to :parcel
end
