class JourneysController < ApplicationController

  def index
  end

  def new
    @journey = Journey.create
  end

  def show
    @journey = Journey.find(params[:id])
  end

end
