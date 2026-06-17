class CreateSituationships < ActiveRecord::Migration[8.1]
  def change
    create_table :situationships do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :phase
      t.integer :power_dynamic
      t.integer :time_of_day
      t.integer :unnamed_feeling
      t.integer :attachment_clash
      t.integer :emotional_intensity
      t.integer :hope_level
      t.integer :jealousy_factor
      t.integer :physicality
      t.integer :ambiguity_level
      t.boolean :talk_happened
      t.boolean :others_involved
      t.integer :last_seen_days_ago
      t.text :specific_detail

      t.timestamps
    end
  end
end
