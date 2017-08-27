require 'grape'
require 'sinatra'

require 'redis_sessions'

require_relative 'libs/config'
require_relative 'libs/services'

require_relative 'api/versions/api_v1'

module RunningTracker
  class API < Grape::API

  	RunningTracker::Config.load_config!

  	Grape::RedisSessions.configure do |config|
  		config.redis_endpoint = RunningTracker::Config.config['sessions']['redis_endpoint']
  		config.access_token_lifetime = RunningTracker::Config.config['sessions']['access_token_lifetime']
  	end

  	helpers Grape::RedisSessions::Helpers::Authentication

    mount RunningTracker::V1::Base
  end
end