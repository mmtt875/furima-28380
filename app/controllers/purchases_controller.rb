class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index
  
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :area_id, 
    :city, :address, :building_name, :phone_number).merge(token: params[:token],item_id: params[:item_id],user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id or @item.purchase.present?
    redirect_to root_path
    end
  end

end
