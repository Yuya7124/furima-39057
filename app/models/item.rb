class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one    :order
  has_one_attached :image

  #バリデーション設定
  validates   :image,            presence: true
  validates   :product_name,     presence: true
  validates   :explanation,      presence: true
  validates   :category_id,      numericality: { other_than: 0 }
  validates   :condition_id,     numericality: { other_than: 0 }
  validates   :delivery_tyoe_id, numericality: { other_than: 0 }
  validates   :prefecture_id,    numericality: { other_than: 0 }
  validates   :shipment_date_id, numericality: { other_than: 0 }
  validates   :cost,             presence: true 

end
