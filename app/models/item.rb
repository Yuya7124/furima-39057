class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  #バリデーション設定
  with_options presence: true do
    validates   :image
    validates   :product_name
    validates   :explanation
    validates   :cost, numericality: { greater_than_or_equal_to: 300, less_than: 10000000, allow_blank: true }
  end

  with_options numericality: { other_than: 0, message: "can't be blank"} do
    validates   :category_id 
    validates   :condition_id
    validates   :delivery_type_id
    validates   :prefecture_id
    validates   :shipment_date_id
  end
  
  belongs_to        :user
  # has_one         :order
  has_one_attached  :image
  belongs_to        :category
  belongs_to        :condition
  belongs_to        :delivery_type
  belongs_to        :prefecture
  belongs_to        :shipment_date
end
