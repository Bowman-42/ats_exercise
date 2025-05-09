require "test_helper"

class HiredTest < ActiveSupport::TestCase

    def setup
        @application = applications(:application_one)
    end

    test "creates correct application_event" do
        date = Date.today
        existing_events = @application.application_events.count
        Application::Event::Hired.create(payload: {application_id: @application.id, date: date})
        assert_equal(existing_events+1,@application.application_events.count)
        event = @application.application_events.last
        assert_equal("Application::Event::Hired", event.event_type)
        assert_equal(date.to_s, event.payload["date"])

    end

    test "updates application status" do
        existing_events = @application.application_events.count
        Application::Event::Hired.create(payload: {application_id: @application.id})
        assert_equal(existing_events+1,@application.application_events.count)
        @application.reload
        assert_equal("hired", @application.status)
    end

    test "fails on missing application_id" do
        assert_raises(Exception) do
            Application::Event::Hired.create(payload: {})
        end
    end

    test "fails on wrong application_id" do
        assert_raises(Exception) do
            Application::Event::Hired.create(payload: {application_id: 123})
        end
    end
end