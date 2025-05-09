class Application < ApplicationRecord

    belongs_to :job
    has_many :application_events, class_name: "Application::Event::BaseEvent"

    validates :candidate_name, presence: true
end
