class AddCounterCacheToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :reviews_counter, :integer
  end
end
