require "rails_helper"

describe User do
	it 'can create' do
		expect do 
			FactoryBot.create :user 
		end.to change{ User.count }.by(1)
	end	

	it 'can delete' do
		#create new user
		FactoryBot.create :user

		#delete user
		expect do 
			User.last.destroy
		end.to change{ User.count }.by(-1)
	end	
end
