class Rock < ApplicationRecord
  validates :name,:color,:brilliance,:hardness, presence: true
  validates :name, length: {minimum: 4}
  validates :hardness,:brilliance, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10  } 
end
