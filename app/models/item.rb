class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image

  
  belongs_to :category
  belongs_to :item_condition
  belongs_to :charge
  belongs_to :address
  belongs_to :preparation_day

  with_options presence: true do
    validates :user_id
    validates :image
    validates :name
    validates :introduction
    validates :category_id
    validates :item_condition_id
    validates :charges_id
    validates :address_id
    validates :preparation_day_id
    # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    # 整数のみ  
    validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :item_condition_id
    validates :charges_id
    validates :address_id
    validates :preparation_day_id
  end
end
