feature 'Visiting the homepage' do
  scenario 'The title page is visible' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end
end

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    Bookmark.create(url: 'http://www.makersacademy.com', title: "Makers Academy")
    Bookmark.create(url: 'http://www.twitter.com', title: "Twitter")
    Bookmark.create(url: 'http://www.facebook.com', title: "Facebook")

    visit('/bookmarks')

    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Twitter', href: 'http://www.twitter.com')
    expect(page).to have_link('Facebook', href: 'http://www.facebook.com')
  end
end
