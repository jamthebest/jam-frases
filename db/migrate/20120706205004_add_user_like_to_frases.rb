class AddUserLikeToFrases < ActiveRecord::Migration
  def change
    add_column :frases, :user_likes, :string
  end
end
