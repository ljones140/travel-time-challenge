class VisitsController < ApplicationController

  def new
    @journey = Journey.find(params[:journey_id])
    @visit = Visit.new
  end

  def create
    @journey = Journey.find(params[:journey_id])
    @journey.visits.create(visit_params)
    redirect_to new_journey_visit_path(@journey)
  end

  def visit_params
    params.require(:visit).permit(:postcode)
  end

end
