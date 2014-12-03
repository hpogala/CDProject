class CoursesController < ApplicationController
 before_filter :authenticate_user!
  def new
    @department = Department.find(params[:department_id])
    @course = @department.courses.build
  end
  
  def show
    
  end

  def edit
    @course = Course.find(params[:id])
  end

  def index
    @department = Department.find(params[:department_id])
    @courses = Course.where(department_id: params[:department_id])
  end
  
  def update
    @course = Course.find params[:id]
    @course.update_attributes!(course_params)
    department = @course.department
    redirect_to department_courses_path(department)
  end

  def create
     @department = Department.find(params[:department_id])
     @course = @department.courses.create(course_params)
     redirect_to department_courses_path
  end
  private 
  def course_params
    params.require(:course).permit(:code, :name, :professor)
  end
end
