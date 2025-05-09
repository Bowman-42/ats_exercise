class Job::Event::Deactivated < Job::Event::BaseEvent
    payload_attributes :job_id
    
    def apply(job)
        job.status = "deactivated"
        job
    end
  end