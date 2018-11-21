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
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.bbc.co.uk/sport');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

    visit('/bookmarks')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "https://www.bbc.co.uk/sport"
    expect(page).to have_content "http://www.google.com"
  end
end
