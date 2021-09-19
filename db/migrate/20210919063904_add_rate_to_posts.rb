class AddRateToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :rate_smell, :float
    add_column :posts, :rate_time, :float
    add_column :posts, :rate_price, :float
  end
end
