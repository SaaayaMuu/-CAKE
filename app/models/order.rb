class Order < ApplicationRecord
  
  belongs_to :customer_id
  has_many :order_details

end
