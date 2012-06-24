class AvailabilitiesController < ApplicationController
  # POST /availabilities
  # POST /availabilities.json
  def create
    @availability = Availability.new(params[:availability])

    respond_to do |format|
      if @availability.save
        format.html { redirect_to @availability, notice: 'Availability was successfully created.' }
        format.json { render json: @availability, status: :created, location: @availability }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @availability.errors, status: :unprocessable_entity }
        format.js{ render json: @availability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /availabilities/1
  # PUT /availabilities/1.json
  def update
    @availability = Availability.find(params[:id])

    respond_to do |format|
      if @availability.update_or_delete(params[:availability])
        if @availability.destroyed?
          format.html { redirect_to Availability.new, notice: 'Availability was successfully deleted.' }
          format.json { head :no_content } # json not tested; should it redirect?
          format.js 
        else
          format.html { redirect_to @availability, notice: 'Availability was successfully updated.' }
          format.json { head :no_content }
          format.js 
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @availability.errors, status: :unprocessable_entity }
        format.js{ render json: @availability.errors, status: :unprocessable_entity }
      end
    end
  end
end
