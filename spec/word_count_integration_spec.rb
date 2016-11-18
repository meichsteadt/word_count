require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the word_count path', {:type => :feature}) do
  it('counts the amount of times a word appears in a sentece') do
    visit('/')
    fill_in('sentence', :with => 'Williamsburg cray paleo paleopop-up listicle')
    fill_in('search_word', :with => "paleo")
    click_button('Submit')
    expect(page).to have_content('paleo appears 2 times in Williamsburg cray paleo paleopop-up listicle')
  end
  it('counts the amount of times a word appears in a sentece while checking the strict box') do
    visit('/')
    fill_in('sentence', :with => 'Williamsburg cray paleo paleopop-up listicle')
    fill_in('search_word', :with => "paleo")
    check('check[]')
    click_button('Submit')
    expect(page).to have_content('paleo appears 1 times in Williamsburg cray paleo paleopop-up listicle')
  end
end
