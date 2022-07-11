class Admin::HomesController < ApplicationController
  
  def top
#    @order = Order.all
    @order_details = OrderDetail.all
#    @amount = @order.order_detail.amount
    @orders = Order.page(params[:page]).order("created_at DESC")
#    @amount = OrderDetail.find[:order_id][:amount]
#    @amount = @order.order_detail.all.sum(:amount)
#    @amount = @order.params[:order_detail][:amount]
  end  
  
end
