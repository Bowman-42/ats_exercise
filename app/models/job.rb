class Job < ApplicationRecord
    has_many :job_events, class_name: "Job::Event::BaseEvent"
    has_many :applications

    validates :title, presence: true
end
