class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user

  
  belongs_to :category
  belongs_to :item_condition
  belongs_to :charge
  belongs_to :address
  belongs_to :preparation_day

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    validates :category_id
    validates :item_condition_id
    validates :charge_id
    validates :address_id
    validates :preparation_day_id
    # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :item_condition_id
    validates :charge_id
    validates :address_id
    validates :preparation_day_id
  end
end
