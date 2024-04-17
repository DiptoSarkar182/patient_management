class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.role == 'doctor'
        render "doctors/index"
      else
        @patients = Patient.order(created_at: :desc)
        render "patients/index"
      end
    else
      redirect_to new_user_session_path
    end
  end
end
