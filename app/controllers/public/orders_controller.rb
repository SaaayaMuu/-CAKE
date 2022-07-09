class Public::OrdersController < ApplicationController
  
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
    @customer = current_customer
  end
  
  
  def comfirm
    @customer = current_customer
    @cart_items = CartItem.all
    @order = Order.new(order_params)
    @order.customers_id = current_customer.id
    @order.postage = 800#@order = current_customer.orders.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
   elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif
      @order.postal_code = @order.postal_code
      @order.address = @order.address
      @order.name = @order.name
    end
  end
  
  
  def create
    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_methods]
    cart_items = current_customer.cart_items.all
    if @order.save
      
      cart_items.each do |cart_item|
        
        @order_detail = OrderDetail.new
        @order_detail.item_id = cart_item.item_id 
        @order_detail.order_id = @order.id
        @order_detail.price = cart_item.item.with_tax_price
        @order_detail.amount =  cart_item.item.amount
        @order_detail.save
      end
      redirect_to orders_thanks_path
      cart_items.destroy_all
    end
#    redirect_to root_path
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :postage, :total_price, :customers_id,)
  end
  
#  def order_detail_params
#    params.require(:order_detail).permit(:item_id, :order_id, :price, :amount)
#  end

end
