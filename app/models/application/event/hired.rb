class Application::Event::Hired < Application::Event::BaseEvent
    payload_attributes :application_id, :date
    
    def apply(application)
        application.status = 'hired'
        application
    end
  end