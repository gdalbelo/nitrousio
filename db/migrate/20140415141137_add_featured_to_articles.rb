class AddFeaturedToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :featured, :boolean, default: false
    add_index :articles, :featured
  end
end
