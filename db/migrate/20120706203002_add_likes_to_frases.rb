class AddLikesToFrases < ActiveRecord::Migration
  def change
    add_column :frases, :likes, :integer
  end
end
