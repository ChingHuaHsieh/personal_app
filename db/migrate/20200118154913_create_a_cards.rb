class CreateACards < ActiveRecord::Migration[5.2]
  def change
    create_table :a_cards do |t|
      t.references :user, null: false
      t.references :q_card, null: false
      t.string :theme
      t.text :description
      t.string :when_to_use1
      t.string :when_to_use2
      t.string :when_to_use3
      t.string :when_to_use4
      t.string :when_to_use5
      t.string :relation1_theme
      t.text :relation1_description
      t.string :relation1_when_to_use1
      t.string :relation1_when_to_use2
      t.string :relation1_when_to_use3
      t.string :relation2_theme
      t.text :relation2_description
      t.string :relation2_when_to_use1
      t.string :relation2_when_to_use2
      t.string :relation2_when_to_use3
      t.string :relation3_theme
      t.text :relation3_description
      t.string :relation3_when_to_use1
      t.string :relation3_when_to_use2
      t.string :relation3_when_to_use3
      t.timestamps
    end
  end
end
