require_relative '../routes/users'
require_relative '../routes/auth'
require_relative '../routes/trainings'

module RunningTracker
  module V1
    class Base < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      mount RunningTracker::V1::Users
      mount RunningTracker::V1::Auth
      mount RunningTracker::V1::Trainings
    end
  end
end