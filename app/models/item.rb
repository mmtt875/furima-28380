class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery_day
  validates :image, :category,:status,:delivery_fee, :area,
            :delivery_day, :price, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000}
  with_options numericality: { other_than: 1 } do
    validates :category_id, :status_id, :delivery_fee_id, :area_id, :delivery_day_id
  end
end
