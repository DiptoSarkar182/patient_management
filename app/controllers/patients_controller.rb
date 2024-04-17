class PatientsController < ApplicationController

  def new
    @patient = Patient.new
  end
  def create
    @patient = Patient.new(patient_params)
    @patient.registered_by = current_user

    respond_to do |format|
      if @patient.save
        format.html {redirect_to root_path, notice: "patient created successfully"}
      else
        format.html {render 'new', status: :unprocessable_entity}
      end
    end
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    respond_to do |format|
      if @patient.update(patient_params)
        format.html {redirect_to patient_path, notice: "Patient updated successfully!"}
      else
        format.html {render 'edit', status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to root_path, notice: "Patient deleted successfully!"
  end

  private
  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :doctor_id)
  end
end
