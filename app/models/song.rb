class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {in: %w(artist_name release_year), message: "%{value} cannot be repeated by the same artist twice in the same year"}
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true
  with_options if: :released do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: { only_integer: true }
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
    end
end
