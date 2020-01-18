class CreateACrads < ActiveRecord::Migration[5.2]
  def change
    create_table :a_crads do |t|

      t.timestamps
    end
  end
end
