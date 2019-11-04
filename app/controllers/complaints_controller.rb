class ComplaintsController < ApplicationController
  def create
    @company = Company.find(params[:company_id])
    @complaint = Complaint.new(detail:params[:complaint][:detail], user: current_user)
    @complaint.company = @company
    @complaint.save
  end
end
