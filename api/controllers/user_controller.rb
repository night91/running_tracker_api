module RunningTracker
	module Controllers
		class User
			class << self
				def active_user_data(user_id)
					RunningTrackerDatabase::User.retrieve(Services.database, user_id).to_h
				end

				def create_user(data)
					RunningTrackerDatabase::User.create(Services.database, data)
				end
			end
		end
	end
end