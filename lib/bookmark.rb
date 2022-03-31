require 'pg'
require './lib/database'

class Bookmark

    def self.all
        connection = PG.connect(dbname: 'Bookmarks')
        result = connection.exec("SELECT * FROM bookmarks;")
        result.map { |bookmark| p bookmark['url'] }
    end
end