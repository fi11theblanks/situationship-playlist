require "test_helper"

class SituationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get situationships_new_url
    assert_response :success
  end

  test "should get create" do
    get situationships_create_url
    assert_response :success
  end

  test "should get show" do
    get situationships_show_url
    assert_response :success
  end
end
