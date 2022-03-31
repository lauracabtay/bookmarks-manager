require 'bookmark'

RSpec.describe Bookmark do
    context "when a bookmark is added" do
        it "returns a list of bookmarks" do
            bookmarks = Bookmark.all
        
            expect(bookmarks).to include "http://www.makersacademy.com/"
            expect(bookmarks).to include "http://www.google.com/"
        end
    end
end