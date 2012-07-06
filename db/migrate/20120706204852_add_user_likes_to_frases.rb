class AddUserLikesToFrases < ActiveRecord::Migration
  def change
    add_column :frases, :user_likes, :integer
  end
end
