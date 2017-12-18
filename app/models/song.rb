class Song < ActiveRecord::Base
  belongs_to :user
  has_many :adds
  has_many :users, through: :adds
  
  before_save :setCase

  validates :title, :artist, presence: true, length: { minimum: 2 }

  def setCase
    self.title.titleize
    self.artist.titleize
  end
end
