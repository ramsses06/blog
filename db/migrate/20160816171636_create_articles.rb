class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.integer :visits_count, :default => 0

      t.timestamps null: false
    end
  end
end
