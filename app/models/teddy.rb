class Teddy < ApplicationRecord
  monetize :price_cents
  belongs_to :category
end
