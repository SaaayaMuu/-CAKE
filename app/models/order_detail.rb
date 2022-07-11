class OrderDetail < ApplicationRecord
  
  belongs_to :order
  belongs_to :item
  
  enum making_status: { can_not_be_manufactured: 0, waiting_for_production: 1, now_at_work: 2, production_completed: 3}
  
end
