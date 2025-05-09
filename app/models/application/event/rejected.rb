class Application::Event::Rejected < Application::Event::BaseEvent
    payload_attributes :application_id
    
    def apply(application)
        application.status = 'rejected'
        application
    end
  end