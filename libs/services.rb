require_relative 'config'

require 'running_tracker_database'
require 'running_tracker_cassandra_database'

module RunningTracker
	class Services
		class << self
			def database
				@database = RunningTrackerDatabase.connect(Config.config['database']) unless @database
				@database
			end

			def cassandra_database
				@cassandra_database = RunningTrackerCassandraDatabase.connect({
					'keyspace': Config.config['cassandra_database']['keyspace'],
					'cluster': {
						hosts: Config.config['cassandra_database']['cluster']['hosts']
					}
				}) unless @cassandra_database
				@cassandra_database
			end
		end
	end
end
