class HomeController < ApplicationController
  def index
    @updates = Update.all
    @papers = Paper.all
  end

  def about
  end
end
