class JourneysController < ApplicationController

  def index
  end

  def new
    @journey = Journey.create
  end

  def show
    @journey = Journey.find(params[:id])
    @journey.calculate_arrival_times
  end

  def update
    @journey = Journey.find(params[:id])
    @journey.start_time = time_params(params)
    @journey.save
    redirect_to new_journey_visit_path(@journey)
  end

  private

  def time_params(params)
    Time.new(*params[:journey].sort.map(&:last).map(&:to_i))
  end

end
