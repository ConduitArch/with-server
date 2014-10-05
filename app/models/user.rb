# encoding: utf-8
# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  phonenumber         :string(255)
#  gcm_id              :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  selfie_file_name    :string(255)
#  selfie_content_type :string(255)
#  selfie_file_size    :integer
#  selfie_updated_at   :datetime
#  paired_user_id      :integer
#

class User < ActiveRecord::Base

  has_one :user, as: :paired_user
  attr_reader :selfie

  has_attached_file :selfie, {styles: { standard: "540x960>" }, url: '/system/:hash.:extension', hash_secret: 'boo' }
  validates_attachment_content_type :selfie, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


end
