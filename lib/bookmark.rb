require 'pg'
require './lib/database'

class Bookmark

    attr_reader :id, :title, :url

    def initialize(id:, title:, url:)
        @id  = id
        @title = title
        @url = url
    end

    def self.all
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'bookmark_manager_test')
        else
            connection = PG.connect(dbname: 'Bookmarks')
        end

        result = connection.exec("SELECT * FROM bookmarks;")
        result.map { |bookmark| 
        Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    }
    end

    def self.add(title:, url:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'bookmark_manager_test')
        else
            connection = PG.connect(dbname: 'Bookmarks')
        end

        result = connection.exec("INSERT INTO bookmarks (title, url) VALUES ('#{title}', '#{url}') RETURNING id, url, title;")
        Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
    end

end


# You may want to update the Bookmark.all method to return instances of the 
# Bookmark class instead of strings. 
# The instance should wrap and expose the attributes id, title and url.