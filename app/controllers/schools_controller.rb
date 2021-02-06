class SchoolsController < ApplicationController
  def index
    @schools = School.all
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
    School.destroy(params[:id])
    redirect_to '/schools'
  end
end
