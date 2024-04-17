class DoctorsController < ApplicationController
  def index
    @patients = current_user.patients
    @patients_by_day = @patients.group_by_day(:appointment_date).count
  end
  def patients_vs_days_graph
    @patients = current_user.patients
    @patients_by_day = @patients.group_by_day(:appointment_date).count
  end
end
