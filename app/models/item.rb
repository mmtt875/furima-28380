class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery_days
  validates :image, :category, :status, :delivery_fee, :area,
            :delivery_days, :price, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000}
  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999}
  with_options numericality: { other_than: 1 } do
    validates :category_id, :status_id, :delivery_fee_id, :area_id, :delivery_days_id
  end
end
