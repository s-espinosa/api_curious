require 'rails_helper'

RSpec.feature "user sees a login" do
  scenario "when a user visits the root path" do
    visit "/"

    expect(page).to have_content("LOGIN")
  end
end
