class SituationshipsController < ApplicationController
  # before_action :authenticate_user!, only: [ :create ]

  def new
    @situationship = Situationship.new
  end

  def create
    @situationship = User.first.situationships.build(situationship_params)
    if @situationship.save
      result = PlaylistGenerator.new(@situationship).call
      if result
        @situationship.create_playlist_result(
          user: User.first,
          input_hash: Digest::MD5.hexdigest(@situationship.attributes.to_s),
          tracks: result["playlist"].to_json
        )
      end
      redirect_to situationship_path(@situationship)
    else
      render :new, status: :unprocessable_entity
    end
  end
  def show
    @situationship = Situationship.find(params[:id])
    @playlist = @situationship.playlist_result
  end

  def save_to_spotify
  @situationship = Situationship.find(params[:id])
  # spotify integration coming next
  redirect_to situationship_path(@situationship), notice: "coming soon"
  end

  private

  def situationship_params
    params.require(:situationship).permit(
      :phase, :power_dynamic, :time_of_day, :unnamed_feeling,
      :attachment_clash, :emotional_intensity, :hope_level,
      :jealousy_factor, :physicality, :ambiguity_level,
      :talk_happened, :others_involved, :last_seen_days_ago,
      :specific_detail, genres: []
    )
  end
end
