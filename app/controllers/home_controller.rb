class HomeController < ApplicationController
  def index
    @featured_at_home = Article.where(featured_at_home: true).first
  end
end
