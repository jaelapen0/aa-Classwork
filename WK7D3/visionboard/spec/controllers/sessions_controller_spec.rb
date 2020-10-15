RSpec.describe SessionsController :type => :controller do
    
    describe "GET#new" do
        get :new
        it "brings you to the login page" do
            expect(response).to render_template(:new)
        end
    end

    describe "POST#create" do
        post :create
        it "logs the user in" do 
        expect(response).to have_http_status(:created)
        end
        it "redirects to the user show page" do
        expect(response).to redirect_to(user_url(user))
        end
        it "if invalid, brings you back to the login page" do
        
        end
    end

    describe "DELETE#destroy" do
        delete :destroy
        it "logs the user out"
    end
end