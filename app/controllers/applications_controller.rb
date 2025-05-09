class ApplicationsController < ApplicationController
  def list
    begin
      applications = Job.where(status: 'activated')
        .joins(:applications)
        .select(
          "jobs.title",  
          "applications.candidate_name", 
          "applications.status", 
          "applications.notes", 
          "applications.last_interview"
        )
      result = applications.map do |s|
          {
            title: s.title,
            candidate_name: s.candidate_name,
            status: s.status,
            notes: s.notes,
            last_interview: s.last_interview
          }
        end
      render json: {data: result, errors: []}
      # Just for illustration of error messaging in api, rescuing all Exceptions is an anti pattern
    rescue Exception => e
      # todo: log the error
      render json: {data: [], errors: [{error: "an error occured"}]}
    end
  end
end
