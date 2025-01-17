class Public::OrdersController < ApplicationController
  
  before_action :authenticate_customer!
  
  def index
    @customer = current_customer
    @orders = @customer.orders.all.order("created_at DESC")
  end
  
  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])
    @order_details = OrderDetail.all
    
  end
  
  def new
    @order = Order.new
    @customer = current_customer
  end
  
  
  def comfirm
    @customer = current_customer
    @cart_items = CartItem.all
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.postage = 800
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
    else
      flash[:error] = '情報を正しく入力して下さい。'
      render :new
    end
  end
  
  
  def create
    @order = Order.new(order_params)
    #binding.pry
    
    @order.payment_method = params[:order][:payment_method]
    @order.save
    
    #@order = params[:order_id] 
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      
      @order_detail = OrderDetail.new
     # binding.pry
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.price = cart_item.item.with_tax_price
      @order_detail.amount =  cart_item.amount
      @order_detail.save
      
    end
    @cart_items.destroy_all
    
    redirect_to orders_thanks_path
#    redirect_to root_path
  end
  
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :postage, :total_price, :customer_id, :status)
  end
  
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
