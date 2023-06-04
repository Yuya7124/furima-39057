class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :tel_number, :user_id, :item_id, :token
   
  VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
  VALID_PHONE_CODE_REGEX = /\A\d{10,11}\z/

  with_options presence: true do
    validates   :postal_code, format: { with: VALID_POSTAL_CODE_REGEX, allow_blank: true }
    validates   :city
    validates   :house_number
    validates   :tel_number, format:{ with: VALID_PHONE_CODE_REGEX, allow_blank: true }
    validates   :token
  end
  validates   :prefecture_id, numericality: { other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, tel_number: tel_number, order_id: order.id)
  end
end
