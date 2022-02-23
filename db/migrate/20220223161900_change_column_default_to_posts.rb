class ChangeColumnDefaultToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :rate_smell, :float, default: 0.0
    change_column :posts, :rate_time, :float, default: 0.0
    change_column :posts, :rate_price, :float, default: 0.0
    change_column :posts, :rate_easy, :float, default: 0.0
  end
end
