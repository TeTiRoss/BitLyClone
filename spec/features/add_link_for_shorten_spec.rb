require 'rails_helper'

feature 'shorten link' do
  before(:each) do
    visit root_path
  end

  scenario 'with valid link' do
    fill_in :link_path, with: 'football.ua'
    click_on 'Shorten link'

    expect(page).to have_content('Your link has been shortened')
    expect(page).to have_content('Shortened link:')
    expect(page).to have_content(Link.last.path)
    expect(page).to have_content('Origin link:')
    expect(page).to have_content('football.ua')
  end

  scenario 'with empty field' do
    fill_in :link_path, with: ''
    click_on 'Shorten link'

    expect(page).to have_content('Not valid link')
  end

  scenario 'with invalid link' do
    fill_in :link_path, with: 'footballua'
    click_on 'Shorten link'

    expect(page).to have_content('Not valid link')
  end
end
