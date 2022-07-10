class OrderDetail < ApplicationRecord
  
  belongs_to :order
  belongs_to :item
  
  enum status: { can_not_be_manufactured: 0, waiting_for_production: 1, now_at_work: 2, production_completedt: 3}
  
end
