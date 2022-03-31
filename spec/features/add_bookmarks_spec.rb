require './app'
RSpec.describe "bookmarks" do
    feature "add bookmarks" do
        scenario "user can add a list of bookmarks" do
            visit('/bookmarks')
            fill_in 'title', with: 'Youtube'
            fill_in 'url', with: 'http://www.youtube.com'
            click_button("Add new bookmark")
            expect(page).to have_content "Youtube"
        end
    end
end