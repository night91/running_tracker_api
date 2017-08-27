module RunningTracker
  module V1
  	class Auth < Grape::API
      format :json

      resource :auth do
        desc 'Login and return the access token'
        params do
          requires :email, type: String, desc: 'User email'
          requires :password, type: String, desc: 'User password'
        end
        post '/login' do
          if RunningTrackerDatabase::Login.authorized?(RunningTracker::Services.database, params[:email], params[:password])
            login = RunningTrackerDatabase::Login.retrieve(RunningTracker::Services.database, params[:email])
            auth_token = create_session(login.user_id)
            { auth_token: auth_token }
          else
            error!('401 Unauthorized', 401)
          end
        end

        post '/revoke' do
          end_session
        end
      end
  	
      rescue_from Grape::Exceptions::ValidationErrors do |e|
        error!(e, 400)
      end
    end
	end
end