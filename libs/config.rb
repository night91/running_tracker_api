require 'yaml'

module RunningTracker
	class Config
		def self.load_config!
			@config = YAML.load_file("./config/config.yaml")
			@config = YAML.load_file("./config/config.yaml.default") unless @config
			fail "Error loading config" unless @config
		end

		def self.config
			@config
		end
	end
end