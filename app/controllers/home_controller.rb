class HomeController < ApplicationController
  def index
    @updates = Update.all
    @updates = Update.all[-12..-1] if @updates.size > 12
    @updates = @updates.reverse
    @papers = Paper.all.reverse
    @conference_papers = Paper.conference_papers.reverse
    @journal_papers = Paper.journal_papers.reverse
    @workshop_papers = Paper.workshop_papers.reverse

    require 'google/scholar'
    raw_query = Google::Scholar::Base.search_author("Sauvik Das")
    # @citation_count = raw_query.authors.first.citation_count
  end

  def about
  end
end
