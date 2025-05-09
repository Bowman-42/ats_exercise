require "test_helper"

class ActivatedTest < ActiveSupport::TestCase
    def setup
        @job = jobs(:good_job)
    end

    test "creates correct application_event" do
        existing_events = @job.job_events.count
        Job::Event::Activated.create(payload: {job_id: @job.id})
        assert_equal(existing_events+1,@job.job_events.count)
        event = @job.job_events.last
        assert_equal("Job::Event::Activated", event.event_type)
    end

    test "updates job status" do
        existing_events = @job.job_events.count
        Job::Event::Activated.create(payload: {job_id: @job.id})
        assert_equal(existing_events+1,@job.job_events.count)
        @job.reload
        assert_equal("activated", @job.status)
    end

    test "fails on missing job_id" do
        existing_events = @job.job_events.count
        assert_raises(Exception) do
            Job::Event::Activated.create(payload: {})
        end
    end

    test "fails on wrong job_id" do
        existing_events = @job.job_events.count
        assert_raises(Exception) do
            Job::Event::Activated.create(payload: {job_id: 123})
        end
    end
end