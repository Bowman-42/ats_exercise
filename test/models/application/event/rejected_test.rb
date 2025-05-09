require "test_helper"

class RejectedTest < ActiveSupport::TestCase

    def setup
        @application = applications(:application_one)
    end

    test "creates correct application_event" do
        existing_events = @application.application_events.count
        Application::Event::Rejected.create(payload: {application_id: @application.id})
        assert_equal(existing_events+1,@application.application_events.count)
        event = @application.application_events.last
        assert_equal("Application::Event::Rejected", event.event_type)

    end

    test "updates application status" do
        existing_events = @application.application_events.count
        Application::Event::Rejected.create(payload: {application_id: @application.id})
        assert_equal(existing_events+1,@application.application_events.count)
        @application.reload
        assert_equal("rejected", @application.status)
    end

    test "fails on missing application_id" do
        assert_raises(Exception) do
            Application::Event::Rejected.create(payload: {})
        end
    end

    test "fails on wrong application_id" do
        assert_raises(Exception) do
            Application::Event::Rejected.create(payload: {application_id: 123})
        end
    end
end