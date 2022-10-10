class CreatePreparationDays < ActiveRecord::Migration[6.0]
  def change
    create_table :preparation_days do |t|

      t.timestamps
    end
  end
end
