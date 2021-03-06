require 'spec_helper'

describe "User pages" do

  subject {page}

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user)}
    before {visit user_path(user)}

    it {should have_content(user.first_name)}
    it {should have_content(user.last_name)}
    it {should have_title(user.first_name)}
    it {should have_title(user.last_name)}
  end

  describe "sign up page" do
    before {visit signup_path}

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "first_name",   with: "Example first_name"
        fill_in "last_name",    with: "Example last_name"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end
