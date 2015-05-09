require 'faker'

namespace :db do
	desc "Fill database with sample data"
		task :populate => :environment do
		Rake::Task['db:reset'].invoke # remove old db - careful

		admin = User.create!(
			:name => "Admin",
			:email => "admin@a.com",
			:password => "12345678",
			:password_confirmation => "12345678",
			:admin => true
			)
		#admin.toggle!(:admin)

		User.create!(
			:name => "Example User",
			:email => "example@railstutorial.org",
			:password => "12345678",
			:password_confirmation => "12345678"
			)

		99.times do|n|
			name = Faker::Name.name
			email = "example-#{n+1}@railstutorial.org"
			password = "12345678"
			User.create!(:name => name,
			:email => email,
			:password => password,
			:password_confirmation => password)
		end
	end
end