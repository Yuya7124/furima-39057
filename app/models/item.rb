class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #バリデーション設定
  validates   :image, presence: true
  validates   :product_name, presence: true
  validates   :explanation, presence: true
  validates   :category_id, numericality: { other_than: 0, message: "can't be blank"}
  validates   :condition_id, numericality: { other_than: 0, message: "can't be blank"}
  validates   :delivery_type_id, numericality: { other_than: 0, message: "can't be blank"}
  validates   :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates   :shipment_date_id, numericality: { other_than: 0, message: "can't be blank" }
  validates   :cost, presence: true, numericality: { greater_than_or_equal_to: 300, less_than: 10000000 }

  belongs_to :user
  has_one    :order
  has_one_attached :image
end
