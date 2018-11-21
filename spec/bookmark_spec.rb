require 'pg'
require 'bookmark'
require './lib/bookmark'

  describe Bookmark do
    describe '.all' do
      it 'returns a list of bookmarks' do
        connection = PG.connect(dbname: 'bookmark_manager_test')


        connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'makers');")
        connection.exec("INSERT INTO bookmarks (url, title) VALUES('https://www.bbc.co.uk/sport', 'bbc sport');")
        connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'google');")

        bookmarks = Bookmark.all

        expect(bookmarks).to include('makers')
        expect(bookmarks).to include('bbc sport')
        expect(bookmarks).to include('google')
    end
  end
  describe '.create' do
    it 'creates a new bookmark and adds it to the database' do
      Bookmark.create(url: 'test', title: 'test title')
      expect(Bookmark.all).to include ('test title')
    end
  end





end
