require_relative '../controllers/user_controller'

module RunningTracker
  module V1
  	class Users < Grape::API
  		format :json

  		resource :users do
  			desc 'Get the current user data'
  			get '/active' do
  				authenticate!
  				RunningTracker::Controllers::User.active_user_data(current_user_id)
  			end

        desc 'Create a new user'
        params do
          requires :email, type: String, desc: 'User email'
          requires :password, type: String, desc: 'User password'
          requires :name, type: String, desc: 'User name'
          requires :lastname, type: String, desc: 'User lastname'
          requires :height, type: Float, desc: 'User height'
          requires :weight, type: Float, desc: 'User weight'
          requires :birthday, type: String, desc: 'User birthday'
        end
				post '/' do
  				RunningTracker::Controllers::User.create_user(params)
  			end
			end
  	end
	end
end