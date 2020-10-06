class ShippingAddress < ApplicationRecord
  belongs_to :purchase
  belongs_to_active_hash :area
  validates :postal_code, :area_id, :city,
            :address, :phone_number, presence: true
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :phone_number, format: { with: /\A[\d]/ }, length:{ maximum: 11 }
  with_options numericality: { other_than: 1 } do
    validates :area_id
  end
end
