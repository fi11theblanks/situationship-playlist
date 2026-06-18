class PlaylistGenerator
  def initialize(situationship)
    @situationship = situationship
  end

  def call
    chat = RubyLLM.chat(model: "gpt-4o")
    response = chat.ask(prompt)
    JSON.parse(response.content.gsub(/```json|```/, "").strip)
  rescue JSON::ParserError
    nil
  end

  private

  def prompt
    s = @situationship
    <<~PROMPT
      you are a music curator. given this situationship:
      phase=#{s.phase}, power_dynamic=#{s.power_dynamic}, time_of_day=#{s.time_of_day},
      unnamed_feeling=#{s.unnamed_feeling}, attachment_clash=#{s.attachment_clash},
      emotional_intensity=#{s.emotional_intensity}, hope_level=#{s.hope_level},
      jealousy_factor=#{s.jealousy_factor}, physicality=#{s.physicality},
      ambiguity_level=#{s.ambiguity_level}, talk_happened=#{s.talk_happened},
      others_involved=#{s.others_involved}, last_seen_days_ago=#{s.last_seen_days_ago},
      specific_detail='#{s.specific_detail}',
      preferred_genres=#{s.genres.join(', ')}.
      recommend 10 tracks with artist and a one sentence reasoning for each.
      prioritize tracks that fit the preferred genres while matching the emotional vibe.
      respond in JSON with this structure: {"playlist": [{"track": "", "artist": "", "reason": ""}]}
    PROMPT
  end
end
