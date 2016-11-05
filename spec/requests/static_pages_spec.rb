require 'spec_helper'

describe "Static pages" do

  subject {page}

  shared_examples_for "all static pages" do
    it {should have_selector('h1', text: heading)}
    it {should have_title(full_title(page_title))}
  end

  describe "Home page" do
    before {visit root_path}
    let(:heading) {'Testing app'}
    let(:page_title) {''}

    it_should_behave_like "all static pages"
    it {should_not have_title('Home')}
  end

  describe "Help page" do
    before {visit help_path}

    it {should have_content('help')}
    it {should have_title(full_title('Help'))}
  end

  describe "About page" do
    before {visit about_path}

    it {should have_content('about')}
    it {should have_title(full_title('About'))}
  end

  describe "Contacts page" do
    before {visit contacts_path}

    it {should have_content('contacts')}
    it {should have_title(full_title('Contacts'))}
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About us"
    expect(page).to have_title(full_title('About Us'))
    click_link "Help"
    expect(page).to have_title(full_title('Help'))
    click_link "Contacts"
    expect(page).to have_title(full_title('Contacts'))
    click_link "Home"
    expect(page).to have_title(full_title('Testing app'))
    click_link "Sign up now"
    expect(page).to have_title(full_title('Sign Up'))
    click_link "testing app"
    expect(page).to have_title(full_title('Testing app'))
  end
end
