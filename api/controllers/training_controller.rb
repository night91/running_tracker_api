module RunningTracker
	module Controllers
		class Training
			class << self
				def all_trainings(user_id)
					RunningTrackerDatabase::TrainingSession.all_training_sessions_by_user_id(Services.database, user_id)
				end
			end
		end
	end
end