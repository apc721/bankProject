require "test_helper"

class BankProjectControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bank_project_index_url
    assert_response :success
  end
end
