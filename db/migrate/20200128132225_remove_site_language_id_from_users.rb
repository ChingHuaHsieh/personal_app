class RemoveSiteLanguageIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :site_language_id, :integer
  end
end
