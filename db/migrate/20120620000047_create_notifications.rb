class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :contenido
      t.integer :de
      t.integer :para
      t.boolean :leido
      t.integer :tipo

      t.timestamps
    end
  end
end
