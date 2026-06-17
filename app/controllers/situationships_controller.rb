class SituationshipsController < ApplicationController
  before_action :authenticate_user!, only: [ :create ]

  def new
    @situationship = Situationship.new
  end

  def create
    @situationship = current_user.situationships.build(situationship_params)
    if @situationship.save
      redirect_to situationship_path(@situationship)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @situationship = Situationship.find(params[:id])
    @playlist = @situationship.playlist_result
  end

  private

  def situationship_params
    params.require(:situationship).permit(
      :phase, :power_dynamic, :time_of_day, :unnamed_feeling,
      :attachment_clash, :emotional_intensity, :hope_level,
      :jealousy_factor, :physicality, :ambiguity_level,
      :talk_happened, :others_involved, :last_seen_days_ago,
      :specific_detail
    )
  end
end
