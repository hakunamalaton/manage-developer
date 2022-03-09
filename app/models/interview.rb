class Interview < ApplicationRecord
  belongs_to :developer

  validates :score, numericality: { in: 1..5 }
end
