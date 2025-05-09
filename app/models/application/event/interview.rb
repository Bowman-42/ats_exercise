class Application::Event::Interview < Application::Event::BaseEvent
    payload_attributes :application_id, :date
    
    def apply(application)
        application.status = 'interview'
        application.last_interview = date
        application
    end
  end