class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table   :destinations do |t|
      t.references :purchase,null: false, foreign_key: true
      t.string     :post_code,null: false
      t.integer    :address_id,null: false
      t.string     :municipality,null: false
      t.string     :house_number,null: false
      t.string     :building_name
      t.string     :phone_number,null: false
      t.timestamps
    end
  end
end
