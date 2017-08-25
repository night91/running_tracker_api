require 'grape'
require_relative 'api/versions/api_v1'

module RunningTracker
  class API < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

		mount RunningTracker::APIV1
  end
end