class ItemsController < ApplicationController
  before_action :move_to_sign_in, except:[:index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to root_path
    else
       render new_item_path
    end
  end

  private
  def move_to_sign_in
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end
  
  def item_params
    params.require(:item).permit(
    :name, :image, :description, :category_id, :status_id, :delivery_fee_id,
    :area_id,:delivery_days_id, :price).merge(user_id: current_user.id)
  end
end
