class WorkloadsController < ApplicationController
  # POST /workloads
  # POST /workloads.json
  def create
    @workload = Workload.new(params[:workload])

    respond_to do |format|
      if @workload.save
        format.html { redirect_to @workload, notice: 'Workload was successfully created.' }
        format.json { render json: @workload, status: :created, location: @workload }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @workload.errors, status: :unprocessable_entity }
        format.js{ render json: @workload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /workloads/1
  # PUT /workloads/1.json
  def update
    @workload = Workload.find(params[:id])

    respond_to do |format|
      if @workload.update_or_delete(params[:workload])
        if @workload.destroyed?
          format.html { redirect_to Workload.new, notice: 'Workload was successfully deleted.' }
          format.json { head :no_content } # json not tested; should it redirect?
          format.js 
        else
          format.html { redirect_to @workload, notice: 'Workload was successfully updated.' }
          format.json { head :no_content }
          format.js 
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @workload.errors, status: :unprocessable_entity }
        format.js{ render json: @workload.errors, status: :unprocessable_entity }
      end
    end
  end
end
