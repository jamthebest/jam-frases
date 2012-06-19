class CreateFrases < ActiveRecord::Migration
  def change
    create_table :frases do |t|
      t.string :autor
      t.string :descripcion
      t.integer :user_id

      t.timestamps
    end
  end
end
