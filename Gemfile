# frozen_string_literal: true
source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }


gem 'sinatra', '~> 2.0'
gem 'grape', '~> 1.0'
gem 'puma', '~> 3.10'

group :internal do
	gem 'running_tracker_database', '~> 0.1'
	gem 'running_tracker_cassandra_database', '~> 0.1'
end
