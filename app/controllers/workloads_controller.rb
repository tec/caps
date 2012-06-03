class WorkloadsController < ApplicationController
  # GET /workloads
  # GET /workloads.json
  def index
    @workloads = Workload.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workloads }
    end
  end

  # GET /workloads/1
  # GET /workloads/1.json
  def show
    @workload = Workload.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workload }
    end
  end

  # GET /workloads/new
  # GET /workloads/new.json
  def new
    @workload = Workload.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workload }
    end
  end

  # GET /workloads/1/edit
  def edit
    @workload = Workload.find(params[:id])
  end

  # POST /workloads
  # POST /workloads.json
  def create
    @workload = Workload.new(params[:workload])

    respond_to do |format|
      if @workload.save
        format.html { redirect_to @workload, notice: 'Workload was successfully created.' }
        format.json { render json: @workload, status: :created, location: @workload }
      else
        format.html { render action: "new" }
        format.json { render json: @workload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /workloads/1
  # PUT /workloads/1.json
  def update
    @workload = Workload.find(params[:id])

    respond_to do |format|
      if @workload.update_attributes(params[:workload])
        format.html { redirect_to @workload, notice: 'Workload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @workload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workloads/1
  # DELETE /workloads/1.json
  def destroy
    @workload = Workload.find(params[:id])
    @workload.destroy

    respond_to do |format|
      format.html { redirect_to workloads_url }
      format.json { head :no_content }
    end
  end
end
