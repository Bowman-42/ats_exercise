class Application::Event::Note < Application::Event::BaseEvent
    payload_attributes :application_id, :content
    
    def apply(application)
        application.notes  += 1
        application
    end
  end