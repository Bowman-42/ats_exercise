class Job::Event::Activated < Job::Event::BaseEvent
    payload_attributes :job_id
    
    def apply(job)
        job.status = "activated"
        job
    end
  end