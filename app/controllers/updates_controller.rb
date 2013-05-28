class UpdatesController < ApplicationController
  before_filter :authenticate

  def index
    @updates = Update.all
  end

  def show
    redirect_to updates_path
  end

  def new
    @update = Update.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @update }
    end
  end

  def edit
    @update = Update.find(params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @update }
    end
  end

  # POST /updates
  # POST /updates.json
  def create
    @update = Update.new(params[:update])

    respond_to do |format|
      if @update.save
        format.html { redirect_to updates_url }
        format.json { head :ok }
      else
        format.html { render action: "new" }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /updates/1
  # PUT /updates/1.json
  def update
    @update = Update.find(params[:id])

    respond_to do |format|
      if @update.update_attributes(params[:update])
        format.html { redirect_to updates_url }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /updates/1
  # DELETE /updates/1.json
  def destroy
    @update = Update.find(params[:id])
    @update.destroy

    respond_to do |format|
      format.html { redirect_to updates_url }
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
