class RemoveLongUrlIndex < ActiveRecord::Migration[5.1]
  def change
    remove_index :links, :long_url
  end
end
