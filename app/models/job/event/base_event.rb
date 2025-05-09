class Job::Event::BaseEvent < ::BaseEvent
    
    self.table_name = "job_events"

    belongs_to :job, class_name: "::Job"
end