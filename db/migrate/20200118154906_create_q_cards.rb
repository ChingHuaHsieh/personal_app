class CreateQCards < ActiveRecord::Migration[5.2]
  def change
    create_table :q_cards do |t|
      t.references :user, null: false
      t.string :theme
      t.text :description
      t.text :m_description
      t.integer :language_id,    null: false
      t.timestamps
    end
  end
end
