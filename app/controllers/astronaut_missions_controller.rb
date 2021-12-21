class AstronautMissionsController < ApplicationController
  def create
    # require 'pry'; binding.pry
    astronaut = Astronaut.find(params[:astronaut_id])
    mission = Mission.find_by("title ILIKE ?", "%#{params[:search]}%")
    AstronautMission.create(astronaut: astronaut, mission: mission)

    redirect_to astronauts_path
  end
end
