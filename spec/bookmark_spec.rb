require 'pg'
require 'bookmark'
require './lib/bookmark'

  describe Bookmark do
    describe '.all' do
      it 'returns a list of bookmarks' do
        connection = PG.connect(dbname: 'bookmark_manager_test')


        connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
        connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.bbc.co.uk/sport');")
        connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

        bookmarks = Bookmark.all

        expect(bookmarks).to include('http://www.makersacademy.com')
        expect(bookmarks).to include('https://www.bbc.co.uk/sport')
        expect(bookmarks).to include('http://www.google.com')
    end
  end
  describe '.create' do
    it 'creates a new bookmark and adds it to the database' do
      Bookmark.create(url: 'test')
      expect(Bookmark.all).to include ('test')
    end
  end





end
