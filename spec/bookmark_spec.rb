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
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end





end
describe '.create' do
  it 'creates a new bookmark' do
    bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
    persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")

    expect(bookmark).to be_a Bookmark
    expect(bookmark.id).to eq persisted_data.first['id']
    expect(bookmark.title).to eq 'Test Bookmark'
    expect(bookmark.url).to eq 'http://www.testbookmark.com'
  end
end
