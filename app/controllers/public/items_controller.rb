class Public::ItemsController < ApplicationController


def index
  @items = Item.all
  @item = Item.order("created_at DESC").limit(1)
end


end