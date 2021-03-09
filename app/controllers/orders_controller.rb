class OrdersController < ApplicationController
  before_action :path_order, only: [:index, :create]
  before_action :set_order, only: [:index, :create]

  def index 
    @buy = Buy.new
  end
  
  def create
    @buy = Buy.new(order_params)
    if @buy.valid?
      pay_item
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

  def path_order
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    elsif user_signed_in? == false
      redirect_to new_user_session_path
    end
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
