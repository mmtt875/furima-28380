class Order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :city, :address, :building_name, :phone_number, :token

  # validates :postal_code, :area_id, :city,
  #           :address, :phone_number, :token, presence: true
  # validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  # validates :phone_number, format: { with: /\A[\d]/ }, length:{ maximum: 11 }
  # with_options numericality: { other_than: 1 } do
  #   validates :area_id
  # end

  def save
    purchase = Purchase.create!(user_id: user_id, item_id: item_id)
    ShippingAddress.create!(postal_code: postal_code, area_id: area_id, city: city, address: address, 
      building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end