feature 'Adding bookmarks' do
  scenario 'User can add bookmark to Bookmark Manager' do
    visit ('/new')
    fill_in('url', with: 'http://testbookmark.com')
    click_button('Submit')
    expect(page).to have_content 'http://testbookmark.com'
  end
end
