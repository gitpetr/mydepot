class Product < ActiveRecord::Base
  has_attached_file :image, styles: { large: "1200x900>", medium: "300x300>", thumb: "100x100#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :title, :description,  presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  has_many :line_items, dependent: :destroy
  before_destroy :ensure_not_referenced_by_any_line_item

private
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'существуют товарные позиции')
      return false
    end
    end
end
