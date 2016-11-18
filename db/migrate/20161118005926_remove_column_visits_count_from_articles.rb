class RemoveColumnVisitsCountFromArticles < ActiveRecord::Migration
  def change
  	remove_column :articles, :visits_count, :integer
  end
end
