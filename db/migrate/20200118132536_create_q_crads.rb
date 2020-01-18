class CreateQCrads < ActiveRecord::Migration[5.2]
  def change
    create_table :q_crads do |t|

      t.timestamps
    end
  end
end
