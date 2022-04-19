class Property < ApplicationRecord
  has_many :stations, dependent: :destroy
  accepts_nested_attributes_for :stations, allow_destroy: true, reject_if: :all_blank
  validates :name, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :age, presence: true
  validates :remarks, presence: true
end
