class ReportsController < ApplicationController
  before_action :set_report, only: [:destroy]

  def index
    @reports = Report.all.page(params[:page]).per(10)
  end

  def create
    @report = Report.new
    @report.post_id = params[:id]
    @report.user = current_user
    if @report.save
      redirect_to root_path, notice: 'Report was successfully created.'
    end
  end

  def destroy
    @report.destroy
    redirect_to reports_url, notice: 'Report was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:id)
    end
end
