class Public::CartItemsController < ApplicationController
  
  before_action :authenticate_customer!
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    
    # ↓　もしすでに同じ商品がカートに入っていたら数量だけ＋にする記述
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      @cart_item.update(amount: @cart_item.amount + params[:cart_item][:amount].to_i)
      redirect_to cart_items_path
		else
		  @cart_item.save
		  redirect_to cart_items_path
		end
  end
  
  def index
    @cart_items = current_customer.cart_items.all
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path#(@cart_item.id)
  end
  
  def destroy_all
    CartItem.destroy_all
    redirect_to items_path
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy 
    redirect_to cart_items_path
  end
  
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
  
end
