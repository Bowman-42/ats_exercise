require "test_helper"

class NoteTest < ActiveSupport::TestCase

    def setup
        @application = applications(:application_one)
    end

    test "creates correct application_event" do
        existing_events = @application.application_events.count
        Application::Event::Note.create(payload: {application_id: @application.id, note: "A note"})
        assert_equal(existing_events+1,@application.application_events.count)
        event = @application.application_events.last
        assert_equal("Application::Event::Note", event.event_type)
        assert_equal("A note", event.payload["note"])

    end

    test "does not update application status updates notes" do
        existing_events = @application.application_events.count
        notes = @application.notes
        status = @application.status
        Application::Event::Note.create(payload: {application_id: @application.id})
        assert_equal(existing_events+1,@application.application_events.count)
        @application.reload
        assert_equal(status, @application.status)
        assert_equal(notes + 1, @application.notes)
    end

    test "fails on missing application_id" do
        assert_raises(Exception) do
            Application::Event::Note.create(payload: {})
        end
    end

    test "fails on wrong application_id" do
        assert_raises(Exception) do
            Application::Event::Note.create(payload: {application_id: 123})
        end
    end
end