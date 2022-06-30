class Public::ItemsController < ApplicationController


def index
  @items = Item.page(params[:page])
  @item = Item.order("created_at DESC").limit(1)

end

def show
  @item = Item.find(params[:id])
  @cart_item = CartItem.new 
end


end