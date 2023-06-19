class RemovePostCounterFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :post_counter, :integer
  end
end
