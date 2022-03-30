require 'pg'
require './lib/database'

class Bookmark

    def initialize(db = Database)
        @db = db
        @bookmarks_array = []
    end

    def add_bookmark(bookmark)
        @bookmarks_array << bookmark
    end

    def all_bookmarks
        # connect to db
        host = String('localhost')
        database = String('Bookmarks')
        user = String('claretaylor')
        
        database = @db.new(host, user, database)

        result = database.query("SELECT url FROM Bookmarks")
        result.map { | h | h['url'] }
    end

    # def setdb(db)
    #     @db = db
    #     return self
    # end
end