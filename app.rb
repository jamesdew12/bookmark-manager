require 'pg'
require 'sinatra/base'
require "./lib/bookmark"
class BookmarkManager < Sinatra::Base
  get '/' do
    erb :bookmarks
  end

  get '/bookmarks' do
  ENV

  @bookmarks = Bookmark.all
  erb :'bookmarks/index'
  end


  run! if app_file == $0
end
