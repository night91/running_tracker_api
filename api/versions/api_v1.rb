module RunningTracker
  class APIV1 < Grape::API
    format :json

    resource :test do
    	get "/" do
    		"hello world!"
    	end	
    end
  end
end