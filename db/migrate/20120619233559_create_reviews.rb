class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :contenido
      t.integer :user_id
      t.integer :perfil

      t.timestamps
    end
  end
end
