class Car < ApplicationRecord
  belongs_to :owner, dependent: :destroy
  has_many :favourites
  has_many :reviews

  validates :brand, presence:true
  validates :model, presence:true, uniqueness:true
  validates :year, presence:true
  validates :fuel, presence:true
end
