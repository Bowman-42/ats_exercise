class Application::Event::BaseEvent < ::BaseEvent

    self.table_name = "application_events"

    belongs_to :application, class_name: "::Application"

end