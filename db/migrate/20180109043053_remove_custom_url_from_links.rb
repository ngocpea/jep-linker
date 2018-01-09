class RemoveCustomUrlFromLinks < ActiveRecord::Migration[5.1]
  def change
    remove_column :links, :custom_url
  end
end
