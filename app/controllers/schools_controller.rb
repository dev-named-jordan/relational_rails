class SchoolsController < ApplicationController
  def index
    @schools = School.all
    # @school = School.find(params[:id])
  end

  def show
    @school = School.find(params[:id])
  end

  def new
  end

  def create

    unless params[:school][:accepts_financial_aid]
      params[:school][:accepts_financial_aid] = false
    end

    school = School.new({
      name: params[:school][:name],
      days_in_school_year: params[:school][:days_in_school_year],
      accepts_financial_aid: params[:school][:accepts_financial_aid]
      })

    school.save

    redirect_to '/schools'
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    school = School.find(params[:id])

    unless params[:school][:accepts_financial_aid]
      params[:school][:accepts_financial_aid] = false
    end

    school.update({
      name: params[:school][:name],
      days_in_school_year: params[:school][:days_in_school_year],
      accepts_financial_aid: params[:school][:accepts_financial_aid]
      })

    school.save

    redirect_to "/schools/#{school.id}"
  end

  def destroy
    # require "pry"; binding.pry
    @school = School.find(params[:id])
    # require "pry"; binding.pry
    # @school.students.destroy(:school_id = params[:id])
    @school.students.destroy_all
    School.destroy(params[:id])
    redirect_to '/schools'
  end

  def students
    # require "pry"; binding.pry
    @school = School.find(params[:id])
    if params[:search]
      @students = @school.students.where('school_days_completed >= ?', params[:search])
    elsif params[:az]
      @students = Student.order_by_name
    else
      @students = @school.students
    end
  end

  def new_student
    @school = School.find(params[:id])
    # @school = School.all.find{ |school| school.id == params[:id].to_i }
    # require "pry"; binding.pry
  end

  def create_student
    school = School.find(params[:id])
    student = school.students.new({
      name: params[:student][:name],
      school_days_completed: params[:student][:school_days_completed],
      needs_financial_aid: params[:student][:needs_financial_aid]})

    student.save

    redirect_to "/schools/#{school.id}/students"
  end
end
