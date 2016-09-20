require_relative '../../../test_helper'

class ApiRespondsWithAllItemsTest < ActionDispatch::IntegrationTest

  def setup
    Capybara.app = Storedom::Application
  end

  def test_it_can_send_all_items
    visit '/api/v1/items'
    assert_equal 200, page.status_code

    assert page.has_content?("id")
    assert page.has_content?("description")
    assert page.has_content?("image_url")
    # more detailed tests

    refute page.has_content?("created_at")
    refute page.has_content?("updated_at")

    within('h1') do
      assert page.has_content?('Items'), "page should have an Items heading"
    end
  end

end


# When I send a GET request to `/api/v1/items`
# I receive a 200 JSON response containing all items
# And each item has an id, name, description, and image_url but not the created_at or updated_at
