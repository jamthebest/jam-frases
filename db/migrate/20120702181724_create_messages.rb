class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :de
      t.integer :para
      t.string :content
      t.string :asunto

      t.timestamps
    end
  end
end
