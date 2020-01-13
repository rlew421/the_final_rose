class ContestantsController < ApplicationController
  def index
    @bachelorette = Bachelorette.find(params[:bachelorette_id])
  end

  def show
    @contestant = Contestant.find(params[:contestant_id])
  end
end
