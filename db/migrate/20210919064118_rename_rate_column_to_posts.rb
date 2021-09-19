class RenameRateColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :rate, :rate_easy
  end
end
