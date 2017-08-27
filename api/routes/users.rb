module RunningTracker
  module V1
  	class Users < Grape::API
  		get '/user' do
  			authenticate!
  			{ active_user: current_user_id }
  		end
  	end
	end
end