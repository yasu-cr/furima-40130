class ItemsController < ApplicationController

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
  params.require(:item).permit(:product, :image, :category_id, :product_condition_id, :shipping_fee_payer_id, :shipping_region_id, :estimated_delivery_id, :price, :product_description ).merge(user_id: current_user.id)
  end

end
