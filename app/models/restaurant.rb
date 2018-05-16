class Restaurant < ApplicationRecord
  CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]
  validates :name, presence: :true
  validates :address, presence: :true
  validates :category, inclusion: {in: CATEGORIES}
  has_many :reviews, dependent: :destroy

  def rating_moy
    moy = 0.0
    self.reviews.each do |review|
      moy += review.rating
    end
    return (moy / self.reviews.size)
  end
end
