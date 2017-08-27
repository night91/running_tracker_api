require_relative '../controllers/training_controller'

module RunningTracker
  module V1
  	class Trainings < Grape::API
  		format :json

  		resource :trainings do
  			desc 'Get all the trainings for the current user'
  			get '/' do
  				authenticate!
  				RunningTracker::Controllers::Training.all_trainings(current_user_id)
  			end
			end
  	end
	end
end