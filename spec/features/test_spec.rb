require './app'

RSpec.describe "features" do
    feature "test" do
        scenario "test sinatra" do
            visit('/')
            expect(page).to have_content "Bookmark Manager"
        end
    end
end