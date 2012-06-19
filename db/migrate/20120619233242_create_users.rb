class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :nombre
      t.string :apellido
      t.datetime :fecha_nac

      t.timestamps
    end
  end
end
