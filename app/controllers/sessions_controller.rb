class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_or_create_by(spotify_id: auth["uid"]) do |u|
      u.display_name = auth["info"]["display_name"]
      u.email = auth["info"]["email"]
    end

    user.update(
      spotify_access_token: auth["credentials"]["token"],
      spotify_refresh_token: auth["credentials"]["refresh_token"],
      token_expires_at: Time.at(auth["credentials"]["expires_at"])
    )

    session[:user_id] = user.id
    redirect_to root_path, notice: "logged in as #{user.display_name}"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def failure
    redirect_to root_path, alert: "spotify auth failed: #{params[:message]}"
  end
end
