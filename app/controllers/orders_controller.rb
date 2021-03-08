class OrdersController < ApplicationController
  def index 
    @buy = Buy.new
    @item = Item.find(params[:item_id])
    if user_signed_in? == false || current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end
  
  def create
    @item = Item.find(params[:item_id])
    @buy = Buy.new(order_params)
    if @buy.valid?
      Payjp.api_key = "sk_test_1bbde456ac300cadeaa2894d"
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @buy.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  def new
  end

  private
  def order_params
    params.require(:buy).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end
end
