require_relative '../routes/users'
require_relative '../routes/auth'

module RunningTracker
  module V1
    class Base < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      mount RunningTracker::V1::Users
      mount RunningTracker::V1::Auth
    end
  end
end