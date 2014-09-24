# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  phonenumber :string(255)
#  gcm_id      :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_users_on_gcm_id       (gcm_id) UNIQUE
#  index_users_on_phonenumber  (phonenumber) UNIQUE
#

class User < ActiveRecord::Base
end
