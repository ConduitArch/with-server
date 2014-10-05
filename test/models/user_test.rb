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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
