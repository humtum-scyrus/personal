class HomeController < ApplicationController
  def index
    @featured = Project.find_all_by_is_featured(true)
    others = Project.order("created_at").select { |proj| not proj.is_featured }.first(11).reverse
    if others.length > 3
      @subfeatured,@mediagrid = [others.first(3),others.last(others.length-3)]
    else
      @subfeatured = others
    end
    @essays = Essay.order("created_at").first(6).reverse
  end


  def temp

  end
end
