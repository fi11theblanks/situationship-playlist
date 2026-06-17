class CreatePlaylistResults < ActiveRecord::Migration[8.1]
  def change
    create_table :playlist_results do |t|
      t.references :user, null: false, foreign_key: true
      t.references :situationship, null: false, foreign_key: true
      t.string :input_hash
      t.text :tracks

      t.timestamps
    end
  end
end
