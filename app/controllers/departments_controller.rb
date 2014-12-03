class DepartmentsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @departments = Department.all
  end

  def create
    @department = Department.create(department_params)
    redirect_to departments_path
  end
  

  def update
    @department = Department.find params[:id]
    @department.update_attributes!(department_params)
    redirect_to department_path(@department)
  end

  def edit
    @department = Department.find params[:id]
  end
  def show
    id = params[:id]
    @department= Department.find(id)
  end
  private
  def department_params
      params.require(:department).permit(:name, :description)
  end
end
