class Situationship < ApplicationRecord
  belongs_to :user
  has_one :playlist_result

  enum phase: { early: 0, deep: 1, falling_apart: 2, post_mortem: 3 }
  enum power_dynamic: { im_waiting: 0, theyre_waiting: 1, equal_chaos: 2 }
  enum time_of_day: { two_am: 0, sunday_afternoon: 1, weekday_limbo: 2 }
  enum unnamed_feeling: { im_fine: 0, not_fine: 1, fine_and_thats_worse: 2 }
  enum attachment_clash: { anxious_avoidant: 0, anxious_anxious: 1, avoidant_avoidant: 2, other: 3 }

  validates :emotional_intensity, :hope_level, :jealousy_factor, :physicality, :ambiguity_level,
            numericality: { in: 1..10 }
end
