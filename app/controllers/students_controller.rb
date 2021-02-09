class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def create
    unless params[:student][:needs_financial_aid]
      params[:student][:needs_financial_aid] = false
    end

    student = Student.new({
      name: params[:student][:name],
      school_days_completed: params[:student][:school_days_completed],
      needs_financial_aid: params[:student][:needs_financial_aid]
      })

    student.save

    redirect_to '/students'
  end
end
