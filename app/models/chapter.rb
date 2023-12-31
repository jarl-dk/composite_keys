class Chapter < ApplicationRecord
  self.primary_key = %i[book_number number]

  belongs_to :book, foreign_key: :book_number, inverse_of: :chapters
end
