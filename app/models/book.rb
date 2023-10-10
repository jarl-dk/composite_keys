class Book < ApplicationRecord
  has_many :chapters, foreign_key: %i[book_number], inverse_of: :book
end
