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
    click_link "Login with Soundcloud"
    assert page.has_content?("Sal")
    assert page.has_link?("Logout")
  end

  def stub_omniauth
   OmniAuth.config.test_mode = true
   # then, provide a set of fake oauth data that
   # omniauth will use when a user tries to authenticate:
   OmniAuth.config.mock_auth[:soundcloud] = OmniAuth::AuthHash.new("{
     \"id\":429635,
     \"kind\":\"user\",
     \"permalink\":\"sespinos\",
     \"username\":\"sespinos\",
     \"last_modified\":\"2016/05/24 15:05:35 +0000\",
     \"uri\":\"https://api.soundcloud.com/users/429635\",
     \"permalink_url\":\"http://soundcloud.com/sespinos\",
     \"avatar_url\":\"https://i1.sndcdn.com/avatars-000050442375-y1p11u-large.jpg\",
     \"country\":\"United States\",
     \"first_name\":\"Sal\",
     \"last_name\":\"Espinosa\",
     \"full_name\":\"Sal Espinosa\",
     \"description\":null,
     \"city\":\"Brooklyn\",
     \"discogs_name\":null,
     \"myspace_name\":null,
     \"website\":null,
     \"website_title\":null,
     \"online\":false,
     \"track_count\":0,
     \"playlist_count\":0,
     \"plan\":\"Free\",
     \"public_favorites_count\":0,
     \"subscriptions\":[],
     \"upload_seconds_left\":10800,
     \"quota\":
       {\"unlimited_upload_quota\":false,
        \"upload_seconds_used\":0,
        \"upload_seconds_left\":10800},
     \"private_tracks_count\":0,
     \"private_playlists_count\":0,
     \"primary_email_confirmed\":true,
     \"locale\":\"\",
     \"followers_count\":8,
     \"followings_count\":17
   }")
 end
end
