require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the word_count path', {:type => :feature}) do
  it('counts the amount of times a word appears in a sentece') do
    visit('/')
    fill_in('sentence', :with => 'Williamsburg cray paleo pop-up listicle')
    fill_in('search_word', :with => "paleo")
    click_button('Submit')
    expect(page).to have_content('paleo appears 1 times in Williamsburg cray paleo pop-up listicle')
  end
end
