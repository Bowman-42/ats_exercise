require "test_helper"

class InterviewTest < ActiveSupport::TestCase

    def setup
        @application = applications(:application_one)
        
    end

    test "creates correct application_event" do
        date = Date.today
        existing_events = @application.application_events.count
        Application::Event::Interview.create(payload: {asdasa: "asdasd", application_id: @application.id, date: date})
        assert_equal(existing_events+1,@application.application_events.count)
        event = @application.application_events.last
        assert_equal("Application::Event::Interview", event.event_type)
        assert_equal(date.to_s, event.payload["date"])
    end

    test "updates application status and last interview" do
        date = Date.today
        existing_events = @application.application_events.count
        Application::Event::Interview.create(payload: {application_id: @application.id, date: date})
        assert_equal(existing_events+1,@application.application_events.count)
        @application.reload
        assert_equal("interview", @application.status)
        assert_equal(date, @application.last_interview)
    end

    test "fails on missing application_id" do
        assert_raises(Exception) do
            Application::Event::Interview.create(payload: {})
        end
    end

    test "fails on wrong application_id" do
        assert_raises(Exception) do
            Application::Event::Interview.create(payload: {application_id: 123})
        end
    end
end