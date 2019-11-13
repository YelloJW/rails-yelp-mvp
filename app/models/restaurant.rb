class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  before_validation :category_downcase
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true, inclusion: { in: ['chinese', 'italian', 'japanese', 'french', 'belgian'],
    message: '%{value} is not a valid size' }

  def category_downcase
    self.category = self.category.downcase
  end
end
