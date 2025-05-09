require "test_helper"

class ApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get applications_list_url
    assert_response :success
    result = @response.parsed_body
    expected = [
      {"title"=>"Good Job", "candidate_name"=>"Hugo Hugoson", "status"=>"interview", "notes"=>0, "last_interview"=>"2025-05-09"},
      {"title"=>"Good Job", "candidate_name"=>"Peter Peterson", "status"=>"rejected", "notes"=>0, "last_interview"=>nil},
      {"title"=>"Good Job", "candidate_name"=>"Herman Pörxen", "status"=>"hired", "notes"=>0, "last_interview"=>nil},
      {"title"=>"Good Job", "candidate_name"=>"Bob Bobson", "status"=>"applied", "notes"=>0, "last_interview"=>nil}
    ]
    assert(1, result["data"].size)
    assert_equal(expected, result["data"])
    assert_empty(result["errors"])
  end

  test "error" do
    Job.stubs(:where).raises(Exception, 'message')
    get applications_list_url
    assert_response :success
    result = @response.parsed_body
    assert_empty(result["data"])
    assert_equal([{"error"=>"an error occured"}], result["errors"])
  end
end
