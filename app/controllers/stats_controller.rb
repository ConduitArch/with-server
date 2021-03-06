require 'gcm'

class StatsController < ApplicationController

  include Pushing
  protect_from_forgery with: :null_session

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

  # TODO: secure this (use ids and secrets)
  def pair
    user_pn1 = params[:pn1]
    user_pn2 = params[:pn2]

    user1 = User.find_by_phonenumber(user_pn1)
    user2 = User.find_by_phonenumber(user_pn2)
    user1.paired_user = user2
    user2.paired_user = user1
    user1.save
    user2.save

    render nothing: true, status: :ok
  end

  def send_stats

    phonenumber = params[:phonenumber]
    latitude = params[:latitude]
    longitude = params[:longitude]
    ambient_light = params[:ambient_light]
    activity = params[:activity]
    azimuth = params[:azimuth]
    temperature = params[:temperature]

    user = User.find_by_phonenumber(phonenumber)
    if user && user.paired_user
      gcm = get_gcm
      options = { data: { selfie: user.selfie.url(:standard), selfie_filename: user.selfie_file_name, latitude: latitude, longitude: longitude, ambient_light: ambient_light, activity: activity, azimuth: azimuth, temperature: temperature }}
      gcm.send([user.paired_user.gcm_id], options)
      render nothing: true, status: :ok
    else
      render nothing: true, status: :not_acceptable
    end

  end

  def selfie_upload
    phonenumber = params[:phonenumber]

    user = User.find_by_phonenumber(phonenumber)
    user.selfie = params[:selfie]
    if user.save
      gcm = get_gcm
      options = { data: { selfie: user.selfie.url(:standard), selfie_filename: user.selfie_file_name } }
      gcm.send([user.paired_user.gcm_id], options)
      render nothing: true, status: :ok
    else
      render nothing: true, status: :not_acceptable
    end
  end


end
