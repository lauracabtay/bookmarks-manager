require 'pg'
require './lib/database'

class Bookmark

    def self.all
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'bookmark_manager_test')
        else
            connection = PG.connect(dbname: 'Bookmarks')
        end

        result = connection.exec("SELECT * FROM bookmarks;")
        result.map { |bookmark| p bookmark['url'] }
    end
end