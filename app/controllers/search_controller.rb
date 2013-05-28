class SearchController < ApplicationController
  def index
    tags = params[:tags].split(',') if params[:tags]
    query = params[:query] if params[:query]
    if tags
      @title = params[:tags]
      @projects = Project.all.select { |project| tags.index { |tag| project.tags.include?(tag) } } #gets all project with a tag matching the query
      @essays = Essay.all.select { |essay| tags.index { |tag| essay.tags.include?(tag) } } #gets all project with a tag matching the query
      @active = 'essays' if @essays.length > 0
      @active = 'projects' if @projects.length > 0
    elsif query
      @title = query
      proj_match = Project.where("(markup like :q) or (description like :q) or (title like :q)",{:q => "%#{query}%"}) 
      proj_tag_match = Project.all.select { |project|  project.tags.index { |tag| tag.match((Regexp.new(eval("/.*#{query}.*/")))) } }
      @projects = (proj_match + proj_tag_match).uniq
      essay_match = Essay.where("(markup like :q) or (description like :q) or (title like :q)",{:q => "%#{query}%"})
      essay_tag_match = Essay.all.select { |essay|  essay.tags.index { |tag| tag.match((Regexp.new(eval("/.*#{query}.*/")))) } }
      @essays = (essay_match + essay_tag_match).uniq
      @collaborators = Collaborator.where("(first_name like :q) or (last_name like :q)",{:q => "%#{query}%"})
      puts "Collaborators done"
      @papers = Paper.where("(title like :q) or (venue like :q)",{:q => "%#{query}%"})

      @active = 'papers' if @papers.length > 0
      @active = 'collaborators' if @collaborators.length > 0
      @active = 'essays' if @essays.length > 0
      @active = 'projects' if @projects.length > 0
    else
      flash[:notice] = "Sorry, I couldn't process that request."
      redirect_to root_path
    end
  end
end
