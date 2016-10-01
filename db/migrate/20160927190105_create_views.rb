class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.references :article, index: true, foreign_key: true

      t.timestamps null: false
      t.integer :vistas, default: 0
    end
  end
end
