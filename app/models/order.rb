class Order < ApplicationRecord
  
  belongs_to :customer#,optional:true
  has_many :order_details, dependent: :destroy
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  enum status: { waiting_for_deposit: 0, deposit_confirmation: 1, now_at_work: 2, 
                 preparation_for_shipment: 3, shipped: 4}
                 
  validates :postal_code, presence: true
  validates :name, presence: true
  validates :address, presence: true
end
