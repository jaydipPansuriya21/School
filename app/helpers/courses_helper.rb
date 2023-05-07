module CoursesHelper
  def course_params 
    params.require(:course).permit(:name, :code, :active, tutors_attributes: [:first_name, :last_name, :phone_number])
  end
end