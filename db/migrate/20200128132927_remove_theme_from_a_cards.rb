class RemoveThemeFromACards < ActiveRecord::Migration[5.2]
  def change
    remove_column :a_cards, :theme, :string
    remove_column :a_cards, :relation1_theme, :string
    remove_column :a_cards, :relation2_theme, :string
    remove_column :a_cards, :relation3_theme, :string
  end
end
