require 'rails_helper'
require 'factory_bot'

RSpec.describe UsersController, :type => :controller do
    describe "GET#new" do
        get :new 
        it "renders the new view" do
        expect(response).to render_template(:new)
        end
    end

    describe "GET#show" do
        get :show
        it "renders the User's profile page"
        expect(response).to render_template(:show)
        end
    end

    describe "POST#create" do
        post :create 
        it "signs a user up!" do
        expect(response).to have_http_status(:created)
        end
       
    end

    describe "PATCH#edit" do
        patch :edit
        it "updates a user" 
        expect(response).to have_http_status(200)
    end

    describe "PATCH#update" do
        patch :update
        expect(response).to redirect_to(users_url)
    end

end