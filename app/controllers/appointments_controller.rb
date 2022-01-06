class AppointmentsController < ApplicationController
  def  index
   @appointments = current_user.appointments
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = current_user.appointments.new(appointment_params)

    if @appointment.save
      return redirect_to @appointment, notice: 'consulta cadastrada'
    end

    render :new
  end

  def show
    @appointment = current_user.appointments.find(params[:id])
  end

  def edit
    @appointment = current_user.appointments.find(params[:id])
  end

  def update
    @appointment = current_user.appointments.find(params[:id])

    if @appointment.update(appointment_params)
      return redirect_to appointments_path
    end

    render :index

  end

  def destroy
    @appointment = current_user.appointments.find(params[:id])

    if @appointment.destroy
      return redirect_to appointments_path
    end

    render :index
  end

  private

  def appointment_params
    params.require(:appointment).permit(:title, :description, :visit_date, :address)
  end
end
