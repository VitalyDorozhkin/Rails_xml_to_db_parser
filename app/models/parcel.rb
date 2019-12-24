class Parcel < ApplicationRecord
  has_many :positions
  has_many :invoices, through: :positions
end
