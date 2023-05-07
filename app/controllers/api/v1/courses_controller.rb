class Api::V1::CoursesController < ApplicationController
  include CoursesHelper
  include TutorHelper

  # GET API to list all the courses along with their tutors
  def index
    @courses = Course.all
    render json: @courses
  end

  # Common POST API to create a course & its tutors
  def create
    course = Course.new(course_params)
    if course.save
      render json: course
    else
      render json: { errors: course.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show_tutor
    @tutors = Tutor.all
    render json: @tutors
  end
end
