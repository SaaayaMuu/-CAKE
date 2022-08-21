class Public::ItemsController < ApplicationController


def index
  @items = Item.page(params[:page]).per(12)
  @item = Item.order("created_at DESC").limit(1)
  @all_items_count = Item.all.count

end

def show
  @item = Item.find(params[:id])
  @cart_item = CartItem.new 
end


end