class EmployeesController < ApplicationController

  def index
    @employees = Employee.paginate(page: params[:page], per_page: 5)
  end

  def new
    @employee = Employee.new
  end

  def show
  end

  def destroy
    @employee = Employee.find_by_id(params[:id])
    if @employee.destroy
      redirect_to employees_path
    else
      render 'show'
    end
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_path
    else
      render 'new'
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :password, :role_id)
  end
end
