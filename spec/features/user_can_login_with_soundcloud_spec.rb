require "rails_helper"

RSpec.feature "user logs in with Soundcloud" do
  include Capybara::DSL
  before(:all) do
    Capybara.app = ApiCurious::Application
    stub_omniauth
  end

  scenario "logging in" do
    visit "/"
    assert_equal 200, page.status_code
    click_link "LOGIN"
  end

  def stub_omniauth
   OmniAuth.config.test_mode = true
   # then, provide a set of fake oauth data that
   # omniauth will use when a user tries to authenticate:
   OmniAuth.config.mock_auth[:soundcloud] = OmniAuth::AuthHash.new({
     "code"=>"112e80b5454cab9b7cc1e21020cf9aa4",
     "controller"=>"sessions",
     "action"=>"create"
   })
 end
end
