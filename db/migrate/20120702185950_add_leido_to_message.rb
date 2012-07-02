class AddLeidoToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :leido, :boolean
  end
end
