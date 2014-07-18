class AddFeaturedAtHomeToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :featured_at_home, :boolean, default: false
    add_index :articles, :featured_at_home
  end
end
