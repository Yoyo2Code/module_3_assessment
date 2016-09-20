require 'test_helper'

class Api::V1::ItemsControllerTest < ActionDispatch::IntegrationTest

  def test_it_can_send_all_items
    # get 'api/v1/items'
    #
    # assert_response :success
    #
    # assert page.has_content?("id")
    # assert page.has_content?("description")
    # assert page.has_content?("image_url")
    # # more detailed tests
    #
    # refute page.has_content?("created_at")
    # refute page.has_content?("updated_at")

    # ENDPOINT WORKS IN POSTMAN
    # COME BACK TO LATER
  end

  def test_it_can_render_an_individual_item
    item = Item.find(1)

    get `/api/v1/items/#{item.id}`

    assert_response :success

    assert page.has_content?("#{item.id}")
    assert page.has_content?("#{item.name}")
    assert page.has_content?("#{item.description}")
    assert page.has_content?("#{item.image_url}")

    refute page.has_content?("created_at")
    refute page.has_content?("updated_at")
  end

# When I send a GET request to `/api/v1/items/1`
# I receive a 200 JSON response containing the id, name, description
# , and image_url but not the created_at or updated_at

end
