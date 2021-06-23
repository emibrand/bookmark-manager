require 'bookmark'

describe Bookmark do

  describe '.all' do
    it 'returns all bookmarks' do
      PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.create(url: 'http://makersacademy.com', title: 'Makers Academy')
      Bookmark.create(url: 'http://twitter.com', title: 'Twitter')
      Bookmark.create(url: 'http://facebook.com', title: 'Facebook')

      bookmarks = Bookmark.all

      expected(bookmarks.length).to eq 3
      expect(bookmarks.first). to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmark.first.title).to eq 'Makers Acedmy'
      expect(bookmark.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end
end
