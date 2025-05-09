require "test_helper"

class JobsControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get jobs_list_url
    assert_response :success
    result = @response.parsed_body
    expected = [
      {"title"=>"Good Job", "status"=>"activated", "hired"=>1, "rejected"=>1, "ongoing"=>2}, 
      {"title"=>"deactivated", "status"=>"deactivated", "hired"=>0, "rejected"=>0, "ongoing"=>1}
    ]
    assert_equal(2, result["data"].size)
    assert_equal(expected, result["data"])
    assert_empty(result["errors"])
  end
end
