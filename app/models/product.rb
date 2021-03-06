class Product < ActiveRecord::Base
  belongs_to :user

  validates :title, :user, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, presence: true

  scope :filter_by_title, lambda { |keyword|
    where("lower(title) LIKE ?", "%#{keyword.downcase}%" )
  }

  scope :above_or_equal_to_price, lambda { |price|
    where("price >= ?", price)
  }

  scope :recent, -> {
    order(:updated_at)
  }
end
