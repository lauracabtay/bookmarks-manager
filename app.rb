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

    get '/bookmarks/:id/edit' do
        @bookmark_id = params[:id]
        erb :'bookmarks/edit'
    end

    patch '/bookmarks/:id' do
        Bookmark.update(id: params[:id], url: params[:url], title: params[:title])
        redirect('/bookmarks')
    end
    
    run! if app_file == $0
end