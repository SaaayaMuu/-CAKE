class Item < ApplicationRecord
  
 has_one_attached :image
 belongs_to :genre
 has_many :cart_items, dependent: :destroy
 has_many :order_details, dependent: :destroy
 
 validates :image, presence: { message: '未選択です' }
 validates :name, presence: { message: '未入力です' }
 validates :introduction, presence: { message: '未入力です' }
 validates :genre, presence: { message: '未選択です' }
 validates :price, presence: { message: '未入力です' }

 
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  ## 消費税を求めるメソッド
  def with_tax_price
    (price*1.1).floor
  end

end
  
