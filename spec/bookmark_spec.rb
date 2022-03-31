require 'bookmark'

RSpec.describe Bookmark do
    context "when a bookmark is added" do
        it "returns a list of bookmarks" do
            connection = PG.connect(dbname: 'bookmark_manager_test')

            # Add the test data
            connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com/');")
            connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com/');")
            connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com/');")

            bookmarks = Bookmark.all
        
            expect(bookmarks).to include "http://www.makersacademy.com/"
            expect(bookmarks).to include "http://www.google.com/"
            expect(bookmarks).to include "http://www.destroyallsoftware.com/"
        end
    end
end