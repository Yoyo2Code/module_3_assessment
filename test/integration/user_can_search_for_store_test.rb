require "test_helper"

class UserCanSearchForStoreTest < Capybara::Rails::TestCase
  test "user on home page searching for store" do
    user = User.first
    visit root_path

    fill_in "query", with: 80202
    click_on "Locate"

    assert_equal "/search", current_path

    assert page.has_content?("17 Total Stores")

    within("table") do
      assert page.has_css?('tr.store-details', count: 15)
    end

    within("table") do
      assert page.has_content?("Long Name")
      assert page.has_content?("City")
      assert page.has_content?("Distance")
      assert page.has_content?("Phone Number")
      assert page.has_content?("Store Type")

      assert page.has_content?("Cherry Creek Shopping Center")
      assert page.has_content?("Denver")
      assert page.has_content?("3.25")
      assert page.has_content?("303-270-9189")
      assert page.has_content?("Mobile")

      refute page.has_content?(25.0)
    end
  end
end
