describe "has functioning sign on page" do
    it "signs the user up"
    visit new_session_url
    fill_in 'email', with: 'testing email'
    fill_in 'password', with: 'starwars'
end
