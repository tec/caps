class AssignmentsController < ApplicationController
  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(params[:assignment])

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to @assignment, notice: 'Assignment was successfully created.' }
        format.json { render json: @assignment, status: :created, location: @assignment }
        format.js 
      else
        format.html { render action: "new" }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
        format.js{ render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /assignments/1
  # PUT /assignments/1.json
  def update
    @assignment = Assignment.find(params[:id])

    respond_to do |format|
      if @assignment.update_or_delete(params[:assignment])
        if @assignment.destroyed?
          format.html { redirect_to Assignment.new, notice: 'Assignment was successfully deleted.' }
          format.json { head :no_content } # json not tested; should it redirect?
          format.js 
        else
          format.html { redirect_to @assignment, notice: 'Assignment was successfully updated.' }
          format.json { head :no_content }
          format.js 
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
        format.js { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end
end
