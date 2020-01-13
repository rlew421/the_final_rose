class OutingsController < ApplicationController
  def show
    @outing = Outing.find(params[:outing_id])
  end
end
