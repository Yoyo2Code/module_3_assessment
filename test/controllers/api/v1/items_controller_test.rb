require 'test_helper'

class Api::V1::ItemsControllerTest < ActionDispatch::IntegrationTest

  def test_it_can_send_all_items
    item_one = Item.first

    item_two = Item.last

    get 'api/v1/items'

    assert_response :success

    # assert page.has_content?("id")

    assert page.has_content?("#{item_one.name}")
    assert page.has_content?("#{item_one.description}")
    assert page.has_content?("#{item_one.image_url}")

    refute page.has_content?("#{item_one.created_at}")
    refute page.has_content?("#{item_one.updated_at}")

    assert page.has_content?("#{item_two.name}")
    assert page.has_content?("#{item_two.description}")
    assert page.has_content?("#{item_two.image_url}")

    refute page.has_content?("#{item_two.created_at}")
    refute page.has_content?("#{item_two.updated_at}")
  end

  def test_it_can_render_an_individual_item
    first_item = Item.first

    visit `/api/v1/items/#{first_item.id}`

    assert_equal 200, page.status_code

    # assert page.has_content?("#{item.id}")

    assert page.has_content?("#{first_item.name}")
    assert page.has_content?("#{first_item.description}")
    assert page.has_content?("#{first_item.image_url}")

    refute page.has_content?("created_at")
    refute page.has_content?("updated_at")
  end

  def test_it_can_delete_items
    item = Item.first

    delete "api/v1/items/#{item.id}"

    assert_equal 204, page.status_code

    refute Item.find(item.id)

    #requests a template
  end

  def test_can_create_a_new_item
    item_params = { name: "Bobby",
                    description: "something interesting",
                    image_url: "google.com" }

    post "/api/v1/items", params: {item: item_params}

    # NOT PASSING IN PARAMS IN TEST, BUT WORKING IN POSTMAN

    assert_equal 201, page.status_code

    assert page.has_content?("#{item_params["name"]}")
    assert page.has_content?("#{item_params["description"]}")
    assert page.has_content?("#{item_params["image_url"]}")

    item = Item.find_by(name: item_params["name"])

    refute page.has_content?("#{item.created_at}")
    refute page.has_content?("#{item.updated_at}")
  end
end
