class AddGenresToSituationships < ActiveRecord::Migration[8.1]
  def change
    add_column :situationships, :genres, :string, array: true, default: []
  end
end
