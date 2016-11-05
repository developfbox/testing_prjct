require 'spec_helper'

describe "Static pages" do
  describe "Home page" do
    it "should have the content 'Testing home page'" do
      visit '/static_pages/home'
      expect(page).to have_content('Testing home page')
    end
    it "should have th base title" do
      visit '/static_pages/home'
      expect(page).to have_title("Testing app")
    end
    it "should not have a custom page title" do
      visit '/static_pages/home'
      expect(page).not_to have_title("Home")
    end
  end
  describe "Help page" do
    it "should have the content 'Testing help page'" do
      visit '/static_pages/help'
      expect(page).to have_content('Testing help page')
    end
    it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("Help")
    end
  end
  describe "About page" do
    it "should have the content 'Testing about us page'" do
      visit '/static_pages/about'
      expect(page).to have_content('Testing about us page')
    end
    it "should have the title 'About us'" do
      visit '/static_pages/about'
      expect(page).to have_title("About us")
    end
  end
end
