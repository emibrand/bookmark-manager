require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.twitter.com")
      expect(bookmarks).to include("http://www.facebook.com")
    end
  end
end

describe '.create' do
  it 'creates a new bookmark' do
    Bookmark.create(url: 'http://www.testbookmark.com')
    expect(Bookmark.all).to include 'http://www.testbookmark.com'
  end
end