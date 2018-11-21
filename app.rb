require 'pg'
require 'sinatra/base'
require "./lib/bookmark"
class BookmarkManager < Sinatra::Base
  get '/' do
    erb :bookmarks
  end

  get '/bookmarks' do

  @bookmarks = Bookmark.all
  erb :'bookmarks/index'
  end
  get 'bookmarks/new' do

  erb :'bookmarks/new'


  end
  post 'bookmarks/added' do
    
  end


  run! if app_file == $0
end
