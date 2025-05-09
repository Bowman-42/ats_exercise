require "test_helper"

class JobTest < ActiveSupport::TestCase
  test "creates a record" do
    assert_changes -> {Job.count} do
      Job.create!(title: "Fantastic job")  
    end 
  end

  test "fails on empty title" do
    assert_raises(Exception) do
      assert_no_changes -> {Job.count} do
        Job.create!(title: "")  
      end 
    end
  end
  test "fails on missing title" do
    assert_raises(Exception) do
      assert_no_changes -> {Job.count} do
        Job.create!()  
      end 
    end
  end
end
