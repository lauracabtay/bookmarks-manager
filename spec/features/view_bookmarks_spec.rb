require './app'

RSpec.describe "bookmarks" do
    feature "view bookmarks" do
        scenario "user can view a list of bookmarks" do

            Bookmark.add(title: "Makers Academy", url: "http://www.makersacademy.com")
            Bookmark.add(title: "Destroy All Software", url: "http://www.destroyallsoftware.com")
            Bookmark.add(title: "Google", url: "http://www.google.com")

            visit('/bookmarks')

            expect(page).to have_link("Makers Academy", :href => "http://www.makersacademy.com")
            expect(page).to have_link("Google", :href => "http://www.google.com")
            expect(page).to have_link("Destroy All Software", :href => "http://www.destroyallsoftware.com")
        end
    end
end