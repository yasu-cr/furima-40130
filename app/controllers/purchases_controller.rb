class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def create
    @purchase_address = PurchasesAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def index
    @item = Item.order('created_at DESC')
    @purchase_address = PurchaseAddress.new
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :shipping_region_id, :city, :street_address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item.id])
  end

end
