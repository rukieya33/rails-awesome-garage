class Owner < ApplicationRecord
  validates :nickname, presence: true
end
