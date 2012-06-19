class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :contenido
      t.integer :user_id
      t.integer :frase_id

      t.timestamps
    end
  end
end
