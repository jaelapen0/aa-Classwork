require 'rails_helper'
require 'factory_bot'
RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  subject(:user) do
    FactoryBot.build(:user,
      email: "jonathan@fakesite.com",
      password: "good_password")
  end
    
    describe "validates all incoming data" do
       it {should validate_presence_of(:email)}
          #we need a user in the db to run this command
        it {should validate_uniqueness_of(:email)}

        it {should validate_presence_of(:password_digest)}
    
        it {should validate_presence_of(:session_token)}

        it {should validate_uniqueness_of(:session_token)}
        
        it {should validate_length_of(:password).is_at_least(6)}

    end

    # describe "correctly sets up associations" do
    #   it "should have many goals" do
    #     it {should have_many(:goals) }
    #   end
    # end

    describe "able to correctly set and get encrypted credentials" do
      let(:user) { create :user }
      
      it "doesnt store password as a attribute" do
        expect(User.last.password.nil?).to be true
      end

    #   it "correctly finds a user by credentials" do 
    #       expect(User.find_by_credentials('jonathan@fakesite.com', 'good_password')).to return(:user)
    #   end
    end
end
