require 'bookmark'
require 'database_helpers'

RSpec.describe Bookmark do
    describe ".all" do
        it "returns a list of bookmarks" do
            connection = PG.connect(dbname: 'bookmark_manager_test')

            # Add the test data
            bookmark = Bookmark.add(url: "http://www.makersacademy.com", title: "Makers Academy")
            Bookmark.add(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
            Bookmark.add(url: "http://www.google.com", title: "Google")

            bookmarks = Bookmark.all

            expect(bookmarks.length).to eq 3
            expect(bookmarks.first).to be_a Bookmark
            expect(bookmarks.first.id).to eq bookmark.id
            expect(bookmarks.first.title).to eq 'Makers Academy'
            expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
        end
    end

    describe '.add' do
        it 'creates a new bookmark' do
            bookmark = Bookmark.add(url: 'http://www.example.org', title: 'Test Bookmark')
            persisted_data = persisted_data(id: bookmark.id)

            expect(bookmark).to be_a Bookmark
            expect(bookmark.id).to eq persisted_data['id']
            expect(bookmark.title).to eq 'Test Bookmark'
            expect(bookmark.url).to eq 'http://www.example.org'
        end
    end

    describe '.delete' do
        it 'deletes a bookmark' do
            bookmark = Bookmark.add(title: 'Makers Academy', url: 'http://www.makersacademy.com')
            bookmark = Bookmark.delete(id: bookmark.id)
            expect(Bookmark.all.length).to eq 0
        end
    end

    describe '.update' do
        it 'updates the bookmark with the given data' do
            bookmark = Bookmark.add(title: 'Makers Academy', url: 'http://www.makersacademy.com')
            updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.snakersacademy.com', title: 'Snakers Academy')

            expect(updated_bookmark).to be_a Bookmark
            expect(updated_bookmark.id).to eq bookmark.id
            expect(updated_bookmark.title).to eq 'Snakers Academy'
            expect(updated_bookmark.url).to eq 'http://www.snakersacademy.com'
        end
    end
end