module TutorHelper
  def tutor_params 
    params.require(:tutor).permit(:first_name, :last_name, :phone_number)
  end
end