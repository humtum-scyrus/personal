class CollaboratorsController < ApplicationController
  before_filter :authenticate, :except => [:index,:show]
  # GET /collaborators
  # GET /collaborators.json
  def index
    @collaborators = (params[:q] ? Collaborator.where("(first_name like :q) or (last_name like :q)",{:q => "%#{params[:q]}%"}): Collaborator.all.sort {|a,b| a.last_name <=> b.last_name})

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @collaborators }
    end
  end

  # GET /collaborators/1
  # GET /collaborators/1.json
  def show
    @collaborator = Collaborator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @collaborator }
    end
  end

  # GET /collaborators/new
  # GET /collaborators/new.json
  def new
    @collaborator = Collaborator.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @collaborator }
    end
  end

  # GET /collaborators/1/edit
  def edit
    @collaborator = Collaborator.find(params[:id])
  end

  # POST /collaborators
  # POST /collaborators.json
  def create
    @collaborator = Collaborator.new(params[:collaborator])

    respond_to do |format|
      if @collaborator.save
        format.html { redirect_to @collaborator, notice: 'Collaborator was successfully created.' }
        format.json { render json: @collaborator, status: :created, location: @collaborator }
      else
        format.html { render action: "new" }
        format.json { render json: @collaborator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /collaborators/1
  # PUT /collaborators/1.json
  def update
    @collaborator = Collaborator.find(params[:id])

    respond_to do |format|
      if @collaborator.update_attributes(params[:collaborator])
        format.html { redirect_to @collaborator, notice: 'Collaborator was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @collaborator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collaborators/1
  # DELETE /collaborators/1.json
  def destroy
    @collaborator = Collaborator.find(params[:id])
    @collaborator.destroy

    respond_to do |format|
      format.html { redirect_to collaborators_url }
      format.json { head :ok }
    end
  end


  protected

  def authenticate
    authenticate_or_request_with_http_basic do |user, password|
      retval = user == 'ced' && password == 'carver'
      session[:authenticated] = true if retval
      retval
    end
  end
end
