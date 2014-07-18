class Category < ActiveRecord::Base
  validates :name, presence: true
  has_many :articles

  def to_param
    "#{id} #{name}".parameterize
  end

  def slug
    name.parameterize
  end

  def featured_article
    articles.where(featured: true).first
  end
end
