require 'bookmark'

RSpec.describe Bookmark do
    context "when a bookmark is added" do
        it "returns a list of bookmarks" do
            database_dbl = class_double("Database")
            allow(database_dbl).to receive(:new).with(an_instance_of(String), an_instance_of(String), an_instance_of(String)).and_return database_dbl
            allow(database_dbl).to receive(:query).with(an_instance_of(String)).and_return [{'url' => 'http://www.makersacademy.com/'}]
            bookmark = Bookmark.new(db = database_dbl)
            expect(bookmark.all_bookmarks).to eq ["http://www.makersacademy.com/"]
        end
    end
end