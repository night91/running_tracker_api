module RunningTracker
  module V1
  	class Auth < Grape::API
      format :json

      resource :auth do
        get '/login' do
          params[:email] = 'eddyr.morales@gmail.com'
          params[:password] = '123'

          if RunningTrackerDatabase::Login.authorized?(RunningTracker::Services.database, params[:email], params[:password])
            login = RunningTrackerDatabase::Login.retrieve(RunningTracker::Services.database, params[:email])
            auth_token = create_session(login.user_id)
            { auth_token: auth_token }
          else
            error!('401 Unauthorized', 401)
          end
        end

        get '/revoke' do
          end_session
        end
      end
  	end
	end
end