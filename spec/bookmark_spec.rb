require 'pg'
require 'bookmark'
require './lib/bookmark'

  describe Bookmark do
    describe '.all' do
      it "returns all of the bookmarks" do
        bookmarks = Bookmark.all

        expect(bookmarks).to include("http://www.makersacademy.com")
        expect(bookmarks).to include("http://www.google.com")
        expect(bookmarks).to include("https://www.bbc.co.uk/sport")

      end
    end
  end
