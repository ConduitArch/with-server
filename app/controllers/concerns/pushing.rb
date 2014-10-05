require 'gcm'

module Pushing
  extend ActiveSupport::Concern

  def get_gcm
    GCM.new('AIzaSyDLjHMmmEr--yPph2n-1irfDxawDXkS6uI') # TODO: move key to config
  end

end