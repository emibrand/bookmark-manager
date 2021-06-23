feature 'Adding bookmarks' do
  scenario 'User can add bookmark to Bookmark Manager' do
    visit '/new'
    fill_in('url', with: 'http://testbookmark.com')
    fill_in('title', with: "Test Bookmark")
    click_button('Submit')
    expect(page).to have_link('Test Bookmark', href: 'http://testbookmark.com')
  end
end
