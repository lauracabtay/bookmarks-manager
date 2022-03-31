require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
    configure :development do
        register Sinatra::Reloader
    end

    enable :sessions, :method_override

    get '/' do
        erb :index
    end

    get '/bookmarks' do
         @bookmarks = Bookmark.all
        erb :bookmarks
    end

    post '/bookmarks/new' do
        @bookmarks_added = Bookmark.add(title: params[:title], url: params[:url])
        redirect '/bookmarks'
    end

    delete '/bookmarks/:id' do
        Bookmark.delete(id: params[:id])
        redirect '/bookmarks'
    end
    
    run! if app_file == $0
end