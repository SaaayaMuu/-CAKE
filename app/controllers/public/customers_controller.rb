class Public::CustomersController < ApplicationController
  
  def show

  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def unsubscribe
  end
end