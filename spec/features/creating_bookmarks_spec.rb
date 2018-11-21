feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in 'url', with: 'http://www.fulhamfc.com/'
    click_button('Add bookmark')

    expect(page).to have_content 'http://www.fulhamfc.com/'
  end
end
