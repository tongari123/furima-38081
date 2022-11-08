class PurchaseForm
  include ActiveModel::Model
  # order_idは、保存されたタイミングで生成されるため、attr_accessorにおいて不要なカラムとなる（書くと蛇足なのでエラー）
  attr_accessor :user_id, :item_id, :post_code, :address_id, :municipality, :house_number, :building_name, :phone_number, :token

  # 4行目と同じくこのタイミングでは生成前なので「validates :order_id」は不要
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :address_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipality
    validates :house_number
    validates :building_name
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Destination.create(purchase_id: purchase.id, post_code: post_code, address_id: address_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number)
  end
end