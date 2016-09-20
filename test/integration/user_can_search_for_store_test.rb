require "test_helper"

class UserCanSearchForStoreTest < Capybara::Rails::TestCase
  test "user on home page searching for store" do
    user = User.first
    visit root_path

    fill_in "query", with: 80202

    click_on "Locate"

    assert_equal "/search", current_path

    assert page.has_content?("17 Total Stores")
    assert page.has_selector('input', count: 15)

    # expect(page).to have_selector('input', count: 12)

    assert page.has_content?("long name")
    assert page.has_content?("city")
    assert page.has_content?("distance")
    assert page.has_content?("phone number")
    assert page.has_content?("store type")

    # expand tests to be more detailed


  end
end


# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
