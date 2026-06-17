class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :spotify_id
      t.text :spotify_access_token
      t.text :spotify_refresh_token
      t.datetime :token_expires_at
      t.string :display_name
      t.string :email

      t.timestamps
    end
  end
end
