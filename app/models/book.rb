# == Schema Information
#
# Table name: books
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  author     :string           not null
#  isbn       :text             not null
#  genre      :string
#  year       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Book < ApplicationRecord
  validates :title, :author, :isbn, :year, presence: true
  validates :isbn, uniqueness: true

  has_one_attached :cover_img

  has_many :shelvings,
  foreign_key: :book_id,
  class_name: :Shelving

  has_many :bookshelves,
  through: :shelvings,
  source: :bookshelf

  has_many :reviews,
  foreign_key: :book_id,
  class_name: :Review
end
