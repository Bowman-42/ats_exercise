require "test_helper"

class ApplicationTest < ActiveSupport::TestCase

  def setup
    @job = jobs(:good_job)
  end
     
  test "creates a record" do
    assert_changes -> {Application.count} do
      Application.create!(candidate_name: "Hans Hanson", job_id: @job.id)  
    end 
  end

  test "fails on empty title" do
    assert_raises(Exception) do
      assert_no_changes -> {Application.count} do
        Application.create!(candidate_name: "", job_id: @job.id)  
      end 
    end
  end
  test "fails on missing title" do
    assert_raises(Exception) do
      assert_no_changes -> {Application.count} do
        Application.create!(job_id: @job.id)  
      end 
    end
  end

  test "fails on missing job_id" do
    assert_raises(Exception) do
      assert_no_changes -> {Application.count} do
        Application.create!(candidate_name: "Hans Hanson")  
      end 
    end
  end

  test "fails on not existing job_id" do
    assert_raises(Exception) do
      assert_no_changes -> {Application.count} do
        Application.create!(candidate_name: "Hans Hanson")  
      end 
    end
  end
end
