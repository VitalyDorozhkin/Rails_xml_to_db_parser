class Batch < ApplicationRecord
  validates :guid, presence: true, uniqueness: { message: 'GUID already exist' }
  validates :id, presence: true, uniqueness: { message: 'BatchID already exist' }
  has_many :invoices, dependent: :destroy
  has_one_attached :file
end
