require 'gcm'

class StatsController < ApplicationController

  def register_user

    phonenumber = params[:phonenumber]
    gcm_reg_id = params[:reg_id]

    unless phonenumber.empty?
      user = User.find_or_create_by(phonenumber: phonenumber)
      user.gcm_id = gcm_reg_id
      user.save
    end

    render nothing: true, status: :ok

  end

  def send_stats

    to_phonenumber = params[:to_phonenumber]
    latitude = params[:latitude]
    longitude = params[:longitude]
    ambient_light = params[:ambient_light]
    activity = params[:activity]
    azimuth = params[:azimuth]
    temperature = params[:temperature]

    user = User.where(phonenumber: to_phonenumber).order(created_at: :desc).first!
    if user
      gcm = GCM.new('AIzaSyDLjHMmmEr--yPph2n-1irfDxawDXkS6uI') # TODO: move key to config
      options = { data: { latitude: latitude, longitude: longitude, ambient_light: ambient_light, activity: activity, azimuth: azimuth, temperature: temperature }}
      gcm.send([user.gcm_id], options)
      render nothing: true, status: :ok
    else
     render nothing: true, status: :not_acceptable
    end

  end


end
