class JobsController < ApplicationController
  def list
    jobs = Job.all
    stats = Application.where(job_id: jobs.pluck(:id)).group(:job_id,:status).count.to_h
    result =jobs.map do |s|
      applied = stats[[s.id, 'applied']] || 0
      interview  = stats[[s.id, 'interview']] || 0
      {
        title: s.title,
        status: s.status,
        hired: stats[[s.id, 'hired']] || 0,
        rejected: stats[[s.id, 'rejected']] || 0,
        ongoing: applied + interview 
      }
     end
    render json: {data: result, errors: {}}
  end
end
