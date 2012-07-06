class RemoveUserLikesToFrases < ActiveRecord::Migration
  def up
    remove_column :frases, :user_likes
      end

  def down
    add_column :frases, :user_likes, :integer
  end
end
