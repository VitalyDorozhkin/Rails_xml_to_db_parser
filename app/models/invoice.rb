class Invoice < ApplicationRecord
  validates :operation_number, presence: true, uniqueness: { message: 'Operation already exist' }
  belongs_to :batch
  belongs_to :company
  has_many :positions, dependent: :destroy
  has_many :parcels, through: :positions
end







