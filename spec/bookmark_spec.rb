require 'pg'
require 'bookmark'
require './lib/bookmark'

  describe Bookmark do
    describe '.all' do
      it "returns all of the bookmarks" do
        bookmarks = Bookmark.all

        expect(bookmarks).to include("http://www.makersacademy.com")
        expect(bookmarks).to include("http://www.google.com")

      end
    end
  end
