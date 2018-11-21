require 'pg'

feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "lick to see your saved bookmarks"
    end
  end
    feature 'Viewing bookmarks' do
      scenario 'A user can see bookmarks' do
        connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'makers');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('https://www.bbc.co.uk/sport', 'bbc sport');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'google');")

    visit('/bookmarks')

    expect(page).to have_content "makers"
    expect(page).to have_content "bbc sport"
    expect(page).to have_content "google"
  end
end
