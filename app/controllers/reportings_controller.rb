class ReportingsController < ApplicationController
  allow_unauthenticated_access

  def new
    @reporting = Reporting.new
  end

  def create
    @reporting = Reporting.new(reporting_params)

    if @reporting.save
      redirect_to root_path, notice: "Reporting was successfully sent."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def reporting_params
      params.expect(reporting: [ :url, :category, :message ])
    end
end
