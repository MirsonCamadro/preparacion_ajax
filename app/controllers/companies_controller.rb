class CompaniesController < ApplicationController
  before_action :authenticate_user!, except: :index
  
  def index
    @companies = Company.all 
    @company = Company.new
  end

  def create
    @company = Company.create(company_params)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    respond_to do |format|
      format.js 
    end
  end

  def show
    @company = Company.find(params[:id])
    @complaints = Complaint.all.order('created_at DESC')
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
  end

  private

  def company_params
    params.require(:company).permit(:name)  
  end
end
